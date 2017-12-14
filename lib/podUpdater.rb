
# puts "打印_FILE_#{__FILE__}"
lib = File.expand_path('../', __FILE__)
# puts "打印lib:"
# puts lib
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "podUpdater/version"
require "podUpdater/git_tag_flow"


module PodUpdater

	def self.run(version)
		path = File.expand_path(Dir.pwd)		
		pushPodToSevice(path,version)
	end

end



