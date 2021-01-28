class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :derivery_date
  belongs_to :prefecture
  belongs_to :selling_price
  belongs_to :shipment_charge
end
