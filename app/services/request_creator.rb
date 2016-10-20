class RequestCreator
  def create(beers_ids)
    beers_ids.each do |beer_id|
      beer = Beer.find(beer_id)
      Request.create!(beer_id: beer.id)
    end
    true
  end
end
