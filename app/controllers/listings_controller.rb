class ListingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def create
    @user = current_user
    @listing = Listing.new(listing_params)
    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # before_action :authenticate_user!

  # GET /listings
  # GET /listings.json
  def index
    @listings = Listing.all
    # @listings = Listing.where(user: current_user) unless current_user.has_role?(:admin) || current_user.has_role?(:office) || current_user.has_role?(:seeker)

    @ability = Ability.new(current_user)
  end

  def show
    @user = current_user
  end

  def search
    @results = Listing.basic_search(address: params[:address])

    if @results.size == 0
      # handle instance when there aren't any results
    end

    redirect_to "/listings/#{@results.first.id}"
  end
  # GET /listings/new
  def new
    @listing = Listing.new
    @user = current_user
  end

  # GET /listings/1/edit
  def edit
    @user = current_user
  end

  # POST /listings
  # POST /listings.json

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:address, :city, :state, :postcode, :country, :name, :phone, :opening, :closing, :latitude, :longitude, :image, :user_id)
    end
end
