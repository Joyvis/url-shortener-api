# frozen_string_literal: true

class LinksController < ApplicationController
  def show
    link = Link.find_by_shortener_code(params[:shortener_code])

    if link.present?
      redirect_to link.url
    else
      render nil, status: :not_found
    end
  end

  def create
    link = Link.new(link_params)

    if link.save
      render json: link, serializer: LinkSerializer, host_url: host_url,  status: :created
    else
      render json: { error: link.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end

  def host_url
    "#{request.protocol}#{request.host}:#{request.port}"
  end
end
