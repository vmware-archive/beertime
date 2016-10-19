class RequestBeer < ActiveRecord::Migration[5.0]
  def change
    create_join_table :requests, :beers do |t|
      t.index :request_id
      t.index :beer_id
    end
  end
end
