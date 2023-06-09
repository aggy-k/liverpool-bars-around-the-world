class PagesController < ApplicationController
  def home
    @is_explore = params[:explore].present?
    @markers = City.where(name: %w[Jakarta Surabaya Singapore Kuala\ Lumpur]).map {|x| {lat: x.latitude, lng: x.longitude}}
    if @is_explore
      # data-turbo="false" on the form to make the anchor works
      redirect_to root_path(anchor: 'explore-venues')
    end
  end
end
