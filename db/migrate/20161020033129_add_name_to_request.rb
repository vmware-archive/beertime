class AddNameToRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :name, :string
  end
end
