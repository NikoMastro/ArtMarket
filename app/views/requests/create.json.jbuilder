if @rental_request.persisted?
  json.form render(partial: "rental_requests/form", formats: :html, locals: {rental_request: rental_request.new})
  json.inserted_item render(partial: "rental_requests/rental_request", formats: :html, locals: {rental_request: @rental_request})
else
  json.form render(partial: "rental_requests/form", formats: :html, locals: {rental_request: @rental_request})
end
