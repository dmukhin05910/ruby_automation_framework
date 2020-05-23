require 'cucumber'
require 'require_all'
require_all './service'
require_all './assertions'

#Load global configs
$env = YAML.load(File.open("config/env.yaml"))
#Initialize all available endpoints
$endpoints = Service::Endpoints::Endpoints.new


