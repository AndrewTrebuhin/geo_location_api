class CreateAddressables < ActiveRecord::Migration[7.1]
  def change
    create_table :addressables do |t|
      t.string :address, null: false, index: { unique: true }
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
