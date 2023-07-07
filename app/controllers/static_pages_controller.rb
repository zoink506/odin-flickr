class StaticPagesController < ApplicationController
  def index
    flickr = Flickr.new
    @photo_links = []

    if params.has_key?(:user_id)
      if params[:user_id] != ""
        photos = flickr.photos.search(:user_id => params[:user_id])
        @photo_links = photos.map { |ph| Flickr.url_m(ph) }
      elsif params[:user_id] == ""
        photos = flickr.photos.getRecent(per_page: 15)
        p photos
        @photo_links = photos.map { |ph| Flickr.url_m(ph) }
      end
    end

  end
end
