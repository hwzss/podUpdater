
# require "/Users/qwkj/Documents/WZ_GitHub/podUpdater/podUpdater/lib/podUpdater/git_tag_flow.rb"
# require "/Users/qwkj/Documents/WZ_GitHub/podUpdater/podUpdater/lib/podUpdater/modify_podspec.rb"
require "podUpdater/git_tag_flow"
require "podUpdater/modify_podspec"

module PodUpdater

	def sayHi
		puts "heiehieheihehie"
		aPath = File.expand_path('./');puts "哈哈哈#{aPath}"
	end
		# 给定pod库项目的路径，以及新版pod库的版本，将自己的pod提交到git,然后打上tag，再push trunk到pod服务器去
	def pushPodToSevice(path,version)
		# FOR_DEBUG:
		# path = "/Users/qwkj/Documents/WZ_GitHub/WZ_Framework"
		# END

		podFilePath = pathWithPodspecSuffix(path)

		unless podFilePath 
			puts "未找到相应的podspec文件"
			return
		end

		msg = "for pod version:#{version}"

		modifyPodspec(path:podFilePath,version:version)

		git_tag_flow(path,msg,version)

		cmd = []
		cmd << %(pod trunk push #{podFilePath} --allow-warnings)

		IO.popen(cmd.join('')) do |io|
			io.each do |line|
				puts line
			end
		end
		
	end

	module_function :pushPodToSevice
	module_function :sayHi
end