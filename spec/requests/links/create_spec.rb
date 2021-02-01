# frozen_string_literal: true

require "rails_helper"

describe 'creating a shortened url', type: :request do
  let(:parsed_response) { JSON.parse(response.body, symbolize_names: true) }

  before do
    post '/links', params: { link: params }
  end

  context 'when the given url is valid' do
    let(:params) { attributes_for(:link) }

    it 'returns a shorneted url' do
      expect(parsed_response).to include(:shortened_url)
    end

    it 'shortened url is present' do
      expect(parsed_response[:shortened_url]).to be_present
    end

    it 'returns a created status' do
      expect(response).to have_http_status(:created)
    end
  end

  context 'when the given url is not valid' do
    let(:params) { attributes_for(:link, url: 'foo.bar') }


    it 'returns a created status' do
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns a error json node' do
      expect(parsed_response).to include(:error)
    end

    it 'returns invalid url error message' do
      expect(parsed_response[:error][:url]).to eq(['is invalid'])
    end
  end
end
