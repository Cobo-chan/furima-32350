class RegisterInformation
  include ActiveModel::Model
  attr_accessor :postcode, :municipality, :prefecture_id, :address, :optional_address, :phone_number, :token, :user_id, :item_id
  with_options presence: true do
    validates :postcode, :municipality, :address, :phone_number, :token, :user_id, :item_id
  end
  validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/, message: "Input currectly"}
  validates :prefecture_id, numericality: { other_than: 1, message: "Select" }
  validates :phone_number, numericality: { integer: true }
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "Input 10 or 11 characters" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    StreetAddress.create(postcode: postcode, municipality: municipality, prefecture_id: prefecture_id, address: address, phone_number: phone_number, order_id: order.id)
  end
end