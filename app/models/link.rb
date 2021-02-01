# frozen_string_literal: true

class Link < ApplicationRecord
  before_validation :generate_shortener_code

  validates_presence_of :url

  validates :url, format: URI::regexp(%w[http https])

  validates_uniqueness_of :shortener_code, case_sensitive: true

  validates_length_of :url, within: 3..255, on: :create, message: "too long"
  validates_length_of :shortener_code, within: 3..255, on: :create, message: "too long"

  private

  def generate_shortener_code
    self.shortener_code = SecureRandom.uuid[0..5] unless shortener_code.present?
  end
end
