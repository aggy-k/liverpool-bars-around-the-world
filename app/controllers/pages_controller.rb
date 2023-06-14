class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def home
    @is_explore = params[:explore].present?
    # @markers = City.where(name: %w[Jakarta Surabaya Singapore Kuala\ Lumpur]).map {|x| {lat: x.latitude, lng: x.longitude}}
    @markers = Venue.all.map {|x| {
      lat: x.latitude,
      lng: x.longitude,
      info_window_html: Shared::CardComponent.new(venue: x).to_html,
      marker_html: render_to_string(partial: "shared/marker", locals: {venue: x})}
    }
    if @is_explore
      # data-turbo="false" on the form to make the anchor works
      redirect_to root_path(anchor: 'explore-venues')
    end
  end
end
