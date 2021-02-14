class RenameMuniciaprityColumnToStreetAddresses < ActiveRecord::Migration[6.0]
  def change
    rename_column :street_addresses, :municiaprity, :municipality
  end
end
