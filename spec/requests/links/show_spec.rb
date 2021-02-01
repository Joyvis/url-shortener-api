# frozen_string_literal: true

require 'rails_helper'

describe 'showing a shortened url', type: :request  do
  let(:parsed_response) { JSON.parse(response.body, symbolize_names: true) }

  before do
    get "/#{shortener_code}"
  end

  context 'when shortener code is valid' do
    let(:link) { create(:link) }
    let(:shortener_code) { link.shortener_code }

    it 'redirects to url' do
      expect(response).to redirect_to(link.url)
    end
  end

  context 'when shortener code is not valid' do
    let(:shortener_code) { 'foobar' }

    it 'returns not found error' do
      expect(response).to have_http_status(:not_found)
    end
  end
end
