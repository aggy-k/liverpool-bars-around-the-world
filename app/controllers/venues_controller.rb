class VenuesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :regions, :show]
  before_action :set_venue, only: %i[ show edit update destroy ]

  def index
    @is_explore = params[:explore].present?
    # @markers = City.where(name: %w[Jakarta Surabaya Singapore Kuala\ Lumpur]).map {|x| {lat: x.latitude, lng: x.longitude}}
    @venues = Venue.all
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

  def regions
    @map = params[:map_view].present? ? params[:map_view] == 'true' : false
    @venues = Venue.all
    # @venues = @venues.where(....) if params[:region].present?
    @markers = Venue.all.map {|x| {
      lat: x.latitude,
      lng: x.longitude,
      info_window_html: Shared::CardComponent.new(venue: x).to_html,
      marker_html: render_to_string(partial: "shared/marker", locals: {venue: x})}
    }
  end

  def show
    @markers = [{
      lat: @venue.latitude,
      lng: @venue.longitude,
      info_window_html: Shared::CardComponent.new(venue: @venue).to_html,
      marker_html: render_to_string(partial: "shared/marker", locals: {venue: @venue})
    }]
    @opening_hours = [
      [ 'Mon', [ {"open" => '07:00', "close" => '23:00' }] ],
      [ 'Tue', [ {"open" => '07:00', "close" => '23:00' }] ],
      [ 'Wed', [ {"open" => '07:00', "close" => '23:00' }] ],
      [ 'Thu', [ {"open" => '07:00', "close" => '23:00' }] ],
      [ 'Fri', [ {"open" => '07:00', "close" => '23:00' }] ],
      [ 'Sat', [ {"open" => '02:00', "close" => '05:00' }, {"open" => '07:00', "close" => '23:00' }] ],
      [ 'Sun', [ {"open" => '07:00', "close" => '23:00' }] ],
    ]
  end

  # GET /venues/new
  def new
    @venue = Venue.new
  end

  # GET /venues/1/edit
  def edit
  end

  # POST /venues
  def create
    puts "venue_params #{venue_params}"
    # @venue = Venue.new(venue_params)

    # if @venue.save
    #   redirect_to @venue, notice: "Venue was successfully created."
    # else
    #   render :new, status: :unprocessable_entity
    # end
  end

  # PATCH/PUT /venues/1
  def update
    if @venue.update(venue_params)
      redirect_to @venue, notice: "Venue was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /venues/1
  def destroy
    @venue.destroy
    redirect_to venues_url, notice: "Venue was successfully deleted.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venue
      # @venue = Venue.find(params[:id])
      @venue = Venue.find_by(slug: params[:slug])
    end

    # Only allow a list of trusted parameters through.
    def venue_params
      params.require(:venue).permit(:name, :address, :latitude, :float, :longitude, :city_id, :phone_number, :uploader_id, :is_claimed, :venue_admin_id, images: [])
    end
end
