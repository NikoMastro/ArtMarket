class RentingRequestsController < ApplicationController
  # I didnt make a new because displayed inside product page
  # SHOULD BE INSIDE THE NAVBAR
  # GET /renting_requests/client
  # #see all my requests as a seller (Owner)
  #see all my requests as a client (buyer)
  def index
    @renting_requests = current_user.renting_requests.reverse
    @own_products = current_user.products
    @renting_requests_owner = current_user.renting_requests_as_owner.reverse
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
    @renting_request.user = current_user
    @renting_request.product_id = params[:product_id]
    @renting_request.status = "pending"

    @renting_request.total_price = calculate_price
    if @renting_request.save
      redirect_to renting_requests_path
    else
      render 'products/show', status: :unprocessable_entity
    end

    # respond_to do |format|
    #   if @renting_request.save
    #     format.html { redirect_to product_path(@product) }
    #     format.json { render json: @renting_request, status: :created }
    #   else
    #     format.html { render "renting_requests/new", status: :unprocessable_entity }
    #     format.json { render json: @renting_request.errors, status: :unprocessable_entity }
    #   end
    # end
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

  def calculate_price
    @product = Product.find(params[:product_id])
    (Date.parse(@renting_request.end_date) - Date.parse(@renting_request.start_date)).to_i * @product.price
  end

  # def renting_request_params
  #   params.require(:renting_request).permit(:property_id, :client_id, :start_date, :end_date, :message)
  # end

  def renting_request_params
    params.require(:renting_request).permit(:start_date, :end_date, :status, :total_price, :user_id)
  end
end
