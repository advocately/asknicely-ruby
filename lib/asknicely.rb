require 'net/https'
require 'uri'
require 'cgi'
require 'multi_json'
require 'set'
require 'thread'

require 'asknicely/version'
require 'asknicely/utils'
require 'asknicely/json'

require 'asknicely/enumerable_resource_collection'
require 'asknicely/resource'
require 'asknicely/operations/all'
require 'asknicely/operations/retrieve'
require 'asknicely/resources/survey_response'
require 'asknicely/resources/contact'

require 'asknicely/errors'
require 'asknicely/http_response'
require 'asknicely/http_adapter'
require 'asknicely/client'

module Asknicely
  @mutex = Mutex.new

  class << self
    attr_accessor :api_key, :api_base_url, :http_adapter
    attr_writer :shared_client

    def shared_client
      @mutex.synchronize do
        @shared_client ||= Client.new(api_key: api_key, api_base_url: api_base_url, http_adapter: http_adapter)
      end
    end
  end
end
