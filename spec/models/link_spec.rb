# frozen_string_literal: true

require 'rails_helper'

describe Link, type: :model do
  subject { create(:link) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:url) }

    it { is_expected.to validate_uniqueness_of(:shortener_code) }

    it { is_expected.to allow_value('https://foo.com').for(:url) }
    it { is_expected.not_to allow_value('foo.com').for(:url) }
  end

  describe 'generating a shortener code' do
    it 'generates a shortener code' do
      expect(subject.shortener_code).to be_present
    end
  end
end
