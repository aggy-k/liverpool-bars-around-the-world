class VenuesController < ApplicationController
  before_action :set_venue, only: %i[ show edit update destroy ]

  # GET /venues
  def index
    @venues = Venue.all
  end

  # GET /venues/1
  def show
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
    @venue = Venue.new(venue_params)

    if @venue.save
      redirect_to @venue, notice: "Venue was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
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
    redirect_to venues_url, notice: "Venue was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venue
      @venue = Venue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def venue_params
      params.require(:venue).permit(:name, :address, :latitude, :float, :longitude, :city_id, :phone_number, :facebook, :instagram, :twitter, :tiktok, :uploader_id, :is_verified, :venue_admin_id, images: [])
    end
end
