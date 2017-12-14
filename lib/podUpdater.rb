require "podUpdater/version"
require "podUpdater/pod_push"

module PodUpdater
  
  path = Dir.pwd;
  pushPodToSevice(path,'1.0.3')
  
end
