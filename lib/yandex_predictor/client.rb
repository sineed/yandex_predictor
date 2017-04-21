require "yandex_predictor/version"

module YandexPredictor
  class Client
  	def initialize(access_token = nil)
  		@access_token = access_token || ENV["PREDICTOR_ACCESS_TOKEN"]
  	end

  	def perform_request(path,lang)
			url = "https://predictor.yandex.net/api/v1/predict.json/complete?"
			key="#{@access_token}"
			q="#{path}"
			lang="#{lang}"
			response = HTTParty.get(url+"key="+key+"&q="+q+"&lang="+lang)
			JSON.parse(response.body)
		end
  end
end

# pdct.1.1.20170420T132322Z.def0c212af6b1f08.2de32559e1d36b7b8810e24007425f0ee3b90c3d
# require "./lib/yandex_predictor.rb"
# client = YandexPredictor::Client.new("pdct.1.1.20170303T085937Z.3c7ed246fedd19af.e69a7491f2c8c01ccc163e3084ee5a3d3249f133")
# client.perform_request("me","en")