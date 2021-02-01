# frozen_string_literal: true

require 'rails_helper'

describe LinkSerializer, type: :serializer do
  let(:link) { create(:link) }

  subject { described_class.new(link).serializable_hash }

  describe 'checking attributes presence' do
    it { is_expected.to include(:shortened_url) }
  end
end
