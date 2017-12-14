
module PodUpdater

		# 修改podspec的s.verison的值
	def modifyPodspec(path:"",version:"0.0.0")

		if version == "0.0.0"
			puts "请指定版本好的值，如 modifyPodspec version:#{version}"
			return
		end
		unless version =~ /^\d{1,}.\d.\d$|^\d{1,}.\d$|^\d{1,}$/
			puts "version:#{version}的格式不对"
			return 
		end

		# DEBUG：这里写死了路径是为了方便调试，正式用的话需去掉
		# path = "/Users/qwkj/Documents/WZ_GitHub/Ruby_Learning/day_7/QW_Http.podspec"
		# END

		unless File.exist?path
			puts "路径不存在"
			return
		end

		puts "***修改podspec文件***"
		File.open(path, "r+") do |f|
			s = ""
			f.each_line do |line|
				# puts "#{line}"
				if line.to_s =~ /s\.version\s*=\s*"(\d{1,}.\d.\d|\d{1,}.\d|\d{1,})"/
					# puts "匹配到了"
					temp = $1.to_s
					line = line.sub(/\d{1,}.\d.\d|\d{1,}.\d|\d{1,}/) do |match| 
						version.to_s
					end
				end
				s += line
			end
			puts "#{s}"
			File.open(path, "w+") do |f| f.write(s) end
		end	
		
	end
end