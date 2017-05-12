module Yandex
  class Client
    include HTTParty
    base_uri 'https://predictor.yandex.net/api/v1/predict.json/'

    attr_reader :access_token

    format :json

    def initialize(access_token)
      @access_token = access_token || ENV['PREDICTOR_ACCESS_TOKEN']
    end

    def langs
      @langs ||= visit('/getLangs').parsed_response
    end
    alias get_langs langs

    def complete(q, lang)
      options = { q: q, lang: lang }
      visit('/complete', options).parsed_response
    end

    def visit(address, options = {})
      response = self.class.post address, body: options.merge(key: access_token)
      check_errors(response)
      response
    end

    private

    def check_errors(response)
      if response.code && (response.code.to_i != 200)
        raise ApiError, response['message']
      end
    end
  end
end
