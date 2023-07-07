class StaticPagesController < ApplicationController
  def index
    flickr = Flickr.new
    @photo_links = []

    if params.has_key?(:user_id)
      photos = flickr.photos.search(:user_id => params[:user_id])
      @photo_links = photos.map { |ph| Flickr.url_m(ph) }
    end

  end
end
