class RequestCreator
  def create(name, beers_ids)
    beers_ids.each do |beer_id|
      beer = Beer.find(beer_id)
      Request.create!(name: name, beer_id: beer.id)
    end
    true
  end
end
