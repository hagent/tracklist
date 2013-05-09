require 'mp3info'

module TrackList
	def self.f_s(seconds)
		h = seconds.to_i / 60 / 60
		m = seconds.to_i / 60 % 60
		s = seconds.to_i % 60
		"#{"%02d" % h}:#{"%02d" % m}:#{"%02d" % s}"
	end
	
	length = 0
	Dir.glob("*.mp3") do |f|
		Mp3Info.open(f) do |info|
			t = info.tag
			m = info.length.to_i / 60
			s = info.length.to_i % 60
			length += info.length
			puts "#{t.tracknum}. #{t.title} [#{f_s(info.length)}]\n"
		end
	end
	
	puts "album length: [#{f_s(length)}]"


end




