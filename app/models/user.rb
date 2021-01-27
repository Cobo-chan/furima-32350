class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  with_options presence: true do |v|
    v.validates :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday
  end
  with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
    validates :last_name, :first_name
  end
  with_options format: { with: /\A[ァ-ヶ]+\z/ } do
    validates :last_name_kana, :first_name_kana
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
end
