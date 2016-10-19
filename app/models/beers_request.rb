class BeersRequest < ApplicationRecord
  belongs_to :beer
  belongs_to :request
end
