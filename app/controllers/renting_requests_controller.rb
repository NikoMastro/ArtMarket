class RentingRequestsController < ApplicationController
  # before_action :set_renting_request, only: [:show, :edit, :update, :destroy, :accept, :reject]
  before_action :authenticate_user!
  # I didnt make a new because displayed inside product page
  # SHOULD BE INSIDE THE NAVBAR
  # GET /renting_requests/client
  # #see all my requests as a seller (Owner)
  #see all my requests as a client (buyer)
  def index
    @renting_requests = RentingRequest.where(user: current_user)
    @own_products = Product.where(user: current_user)
    @renting_requests_owner = @own_products.map do |product|
      RentingRequest.where(product: product)
    end
  end

  def update
    @renting_request = RentingRequest.find(params[:id])
    if @renting_request.update(renting_request_params)
      redirect_to renting_requests_path
    else
      # render # where was the booking update form?
      render 'index', status: :unprocessable_entity
    end
  end

  # POST /renting_requests
  #create a request as a seller
  def create
    @renting_request = RentingRequest.new(renting_request_params)
    @renting_request.owner = current_user # assuming the current user is the owner

    if @renting_request.save
      redirect_to @renting_request, notice: 'Renting request was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  #accept/reject a request as a seller
  # PATCH/PUT /renting_requests/:id/accept
  # def accept
  #   @renting_request.update(status: 'accepted')
  #   redirect_to #_path, notice: 'Renting request was successfully accepted.'
  # end

  # # PATCH/PUT /renting_requests/:id/reject poo
  # def reject
  #   @renting_request.update(status: 'rejected')
  #   redirect_to #_path, notice: 'Renting request was successfully rejected.'
  # end

  private

  def set_renting_request
    @renting_request = RentingRequest.find(params[:id])
  end

  # def renting_request_params
  #   params.require(:renting_request).permit(:property_id, :client_id, :start_date, :end_date, :message)
  # end

  def renting_request_params
    # TODO: check your model, might be different than mine
    params.require(:renting_request).permit(:status, :start_time, :end_time)
  end
end
