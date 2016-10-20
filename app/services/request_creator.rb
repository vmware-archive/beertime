# frozen_string_literal: true
class RequestCreator
  def create(name:, beer_ids:)
    beer_ids.map do |beer_id|
      beer = Beer.find(beer_id)
      Request.create!(name: name, beer_id: beer.id)
    end
  end
end
