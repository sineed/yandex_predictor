require "yandex_predictor/version"

module YandexPredictor
  class Client

  	include HTTParty

  	attr_reader :access_token

  	base_uri 'https://predictor.yandex.net/api/v1/predict.json/'

  	format :json

  	def initialize(access_token)
  		@access_token = access_token || ENV["PREDICTOR_ACCESS_TOKEN"]
  	end

  	# work
  	def complete(q, lang)
  		response = self.class.get("/complete", query: {key: "#{@access_token}", q: "#{q}", lang: "#{lang}" })
  		response.parsed_response
  	end

  	# work
  	def get_languages
  		response = self.class.get("/getLangs", query: {key: "#{@access_token}" })
  		response.parsed_response
  	end
  end
end

# trace for 'bundle exec irb'
# pdct.1.1.20170420T132322Z.def0c212af6b1f08.2de32559e1d36b7b8810e24007425f0ee3b90c3d
# require "./lib/yandex_predictor.rb"
# client = YandexPredictor::Client.new("pdct.1.1.20170303T085937Z.3c7ed246fedd19af.e69a7491f2c8c01ccc163e3084ee5a3d3249f133")
# client.perform_request("me","en")