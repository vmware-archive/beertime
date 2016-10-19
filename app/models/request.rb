class Request < ApplicationRecord
  has_many :beers, through: :beers_requests
  has_many :beers_requests
end
