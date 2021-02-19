class CreateStreetAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :street_addresses do |t|
      t.string :postcode,           null: false
      t.integer :prefecture_id,     null: false
      t.string :municiaprity,       null: false
      t.string :address,            null: false
      t.string :optional_address
      t.string :phone_number,       null: false
      t.references :order,          null: false, foreign_key: true

      t.timestamps
    end
  end
end
