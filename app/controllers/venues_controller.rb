class VenuesController < ApplicationController
  layout -> { turbo_frame_request? ? false : 'application' }
  skip_before_action :authenticate_user!, only: [:index, :regions, :show]
  before_action :set_venue, only: %i[ show edit update destroy ]

  def index
    # @is_explore = params[:explore].present?
    # @markers = City.where(name: %w[Jakarta Surabaya Singapore Kuala\ Lumpur]).map {|x| {lat: x.latitude, lng: x.longitude}}
    # @venues = Venue.all
    # @markers = Venue.all.map {|x| {
    #   lat: x.latitude,
    #   lng: x.longitude,
    #   info_window_html: Shared::CardComponent.new(venue: x).to_html,
    #   marker_html: render_to_string(partial: "shared/marker", locals: {venue: x})}
    # }
    # if @is_explore
    #   # data-turbo="false" on the form to make the anchor works
    #   redirect_to root_path(anchor: 'explore-venues')
    # end
  end

  def search
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path(anchor: 'explore-venues') }
      format.turbo_stream
    end
  end

  def regions
    # reset_session
    # TODO ----> How to persist the params
    puts "\n\n\n\nparams #{params}\n"
    @page = params[:page] || 1
    @search = params[:search].present? ? params[:search] : session[:search]
    session[:search] = @search
    @region = params[:region].present? ? params[:region] : session[:region]
    session[:region] = @region

    puts "\n @page => #{@page}, @search => #{@search}, @region => #{@region}\n\n\n"
    # @map = params[:map_view].present? ? params[:map_view] == 'true' : false
    @venues = Venue.all

    if @region.present? && @region != 'All'
      @venues = @venues.joins(:city => :country).where(countries: { continent_name: @region })
    end

    if @search.present?
      @venues = @venues.where("venues.name ILIKE ?", "%#{@search}%")
    end

    @venues = @venues.page(@page)
    @markers = @venues.map {|x| {
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
