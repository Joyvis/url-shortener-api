class LinkSerializer < ActiveModel::Serializer
  attributes :shortened_url

  def shortened_url
    "#{@instance_options[:host_url]}/#{object.shortener_code}"
  end
end
