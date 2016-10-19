class RequestCreator
  def create(beers_ids)
    request = Request.create!
    beers_ids.map do |beer_id|
      beer = Beer.find(beer_id)
      BeersRequest.create!(
        request: request,
        beer: beer
      )
    end
    true
  end
end
