module Yandex
  class Client
  	include HTTParty
    base_uri 'https://predictor.yandex.net/api/v1/predict.json/'

  	attr_reader :access_token

  	format :json

  	def initialize(access_token)
  		@access_token = access_token || ENV["PREDICTOR_ACCESS_TOKEN"]
  	end

    def langs
      @langs ||= visit('/getLangs').parsed_response
    end
    alias_method :get_langs, :langs

  	def complete(q, lang)
      options = { q: q, lang: lang }
      result = visit('/complete', options).parsed_response
  	end

    def visit(address, options={})
      response = self.class.post address, body: options.merge(key: access_token)
      check_errors(response)
      response
    end

    private 

    def check_errors(response)
      if response.code and response.code.to_i != 200
        fail ApiError, response['message']
      end
    end
  end
end

# trace for 'bundle exec irb'
# pdct.1.1.20170420T132322Z.def0c212af6b1f08.2de32559e1d36b7b8810e24007425f0ee3b90c3d
# require "./lib/yandex_predictor.rb"
# client = Yandex::Client.new("pdct.1.1.20170303T085937Z.3c7ed246fedd19af.e69a7491f2c8c01ccc163e3084ee5a3d3249f133")
# client.perform_request("me","en")