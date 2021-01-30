class Item < ApplicationRecord
  has_one_attached :image

  with_options presence: true do
    validates :name, :text, :category_id, :condition_id, :shipment_charge_id, :prefecture_id, :derivery_date_id, :selling_price
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id, :condition_id, :shipment_charge_id, :prefecture_id, :derivery_date_id
  end
  validates :selling_price, numericality: { only_integer: true, greater_than: 300, less_than: 9_999_999 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :derivery_date
  belongs_to :prefecture
  belongs_to :selling_price
  belongs_to :shipment_charge
end