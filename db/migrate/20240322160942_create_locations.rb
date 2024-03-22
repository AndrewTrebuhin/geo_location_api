class CreateLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :locations do |t|
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.string :country
      t.string :country_code
      t.string :state
      t.string :state_code
      t.string :postal_code
      t.string :city
      t.jsonb :data, null: false, default: {}
      t.timestamps
    end

    add_index :locations, %i[latitude longitude]
  end
end
