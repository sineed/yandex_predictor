require 'httparty'
require "yandex_predictor/version"
require "yandex_predictor/client"

module YandexPredictor
	def perform_request(path)
			url = "https://predictor.yandex.net/api/v1/predict.json/complete?key=#{@access_token}&q=#{path}&lang=en}"
			response = HTTParty.get(url)
			JSON.parse(response.body)
	end
end

# pdct.1.1.20170420T132322Z.def0c212af6b1f08.2de32559e1d36b7b8810e24007425f0ee3b90c3d
