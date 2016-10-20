class DropRequestsBeers < ActiveRecord::Migration[5.0]
  def change
    drop_table :beers_requests
  end
end
