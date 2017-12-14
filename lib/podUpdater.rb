
# lib = File.expand_path('../', __FILE__)
# $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "podUpdater/version"
require "podUpdater/pod_push"


module PodUpdater

	def self.run(version)
		path = File.expand_path(Dir.pwd)		
		pushPodToSevice(path,version)
	end

end



