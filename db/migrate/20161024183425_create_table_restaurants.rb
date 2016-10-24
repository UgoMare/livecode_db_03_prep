class CreateTableRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.integer :votes, default: 0
      t.timestamps
    end
  end
end
