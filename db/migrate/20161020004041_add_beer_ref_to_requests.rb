class AddBeerRefToRequests < ActiveRecord::Migration[5.0]
  def change
    add_reference :requests, :beer, foreign_key: true, null: false
  end
end
