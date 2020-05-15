require 'cucumber'
require 'require_all'
require_all './service'
require_all './assertions'

$env = YAML.load(File.open("config/env.yaml"))
$endpoints = Service::Endpoints::Endpoints.new


