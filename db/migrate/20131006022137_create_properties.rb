class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|

      t.string      :name, limit: 150
      t.integer     :property_type
      t.integer     :status
      t.integer     :price
      t.date        :year_built
      t.integer     :square_feet
      t.integer     :lot_size
      t.string      :image_url

      # I've seen half/quarter values, and don't want to break this out 
      # into multiple columns
      t.decimal     :baths   
      t.decimal     :bedrooms 

      t.timestamps
    end

    add_index :properties, :property_type
    add_index :properties, :status
    add_index :properties, :price
    add_index :properties, :year_built
    add_index :properties, :square_feet
    add_index :properties, :lot_size
    add_index :properties, :baths
    add_index :properties, :bedrooms
    add_index :properties, :created_at
  end
end
