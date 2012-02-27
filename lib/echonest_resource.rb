require "echonest_resource/version"
require 'active_support'
require 'httparty'
require 'hashie'

class APIKeyMissing     < StandardError; end
class MissingConfigFile < StandardError; end

module EchonestResource
  def self.api_key
    echonest_config = YAML.load_file("#{Rails.root}/config/echonest.yml")
    raise MissingConfigFile if echonest_config.blank?
    echonest_config["api_key"]
  end
end

directory = File.expand_path(File.dirname(__FILE__))

require File.join(directory, 'echonest_resource', 'base')