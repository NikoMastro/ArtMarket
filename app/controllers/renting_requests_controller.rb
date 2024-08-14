class RentingRequestsController < ApplicationController
  #this is our bookmark
  #see all requests as a seller (Owner)
  def index
    @renting_requests = RentingRequest.where(user: current_user)

  end
  #see all requests as a client
  #accept/reject a request
end
