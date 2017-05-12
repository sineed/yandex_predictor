require "spec_helper"

RSpec.describe YandexPredictor do
	let(:access_token) { 'secret' }

	subject(:predictor) { Yandex::Client.new(access_token) }

	describe '#langs' do
		let(:langs_url) {'https://predictor.yandex.net/api/v1/predict.json/getLangs'}
		let(:langs_request_body) { "key=#{access_token}" }
		let(:langs_response_body) { "[\"af\"]" }
		let!(:langs_request) do
      stub_request(:post, langs_url)
      .with(body: langs_request_body)
      .to_return(
        body: langs_response_body,
        headers: { 'Content-Type' => 'application/json' }
      )
		end

		it 'hits correct url' do
			predictor.langs
			expect(langs_request).to have_been_made.once
		end

		it 'returns array of languages' do
			expect(predictor.langs).to eq ['af']
		end
	end

	describe '#complete' do
		let(:complete_url) { 'https://predictor.yandex.net/api/v1/predict.json/complete' }
		let(:complete_request_body) { "q=himml&lang=en&key=#{access_token}" }
		let(:complete_response_body) do
			'{"endOfWord":false,"pos":-4,"text":["himmler"]}'
		end

		let!(:complete_request) do
			stub_request(:post, complete_url)
			.with(body: complete_request_body)
			.to_return(
				body: complete_response_body,
				headers: {'Content-Type' => 'application/json'}
			)
		end

		it 'triggers correct yandex predictor url' do
			predictor.complete('himml', 'en')
			expect(complete_request).to have_been_made.once
		end

		it 'returns prediction' do
			expect(predictor.complete('himml', 'en')['text'][0]).to eq 'himmler'
		end

	end
end
