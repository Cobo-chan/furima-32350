class RegisterInformantion
  include ActiveModel::Model
  attr_accessor :postcode, :municiparity, :prefecture_id, :address, :phone_number
  with_options presence: true do
    validates :postcode, :municiparity, :address, :phone_number
  end
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    Order.create(user_id: user.id, item_id: item.id)
    StreetAddress.create(postcode: postcode, municiparity: municiparity, prefecture_id: prefecture_id, address: address, phone_number: phone_number, order_id: order.id)
  end
end