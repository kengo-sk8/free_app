class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :comments
  has_one :address
  has_one :card

  ##registration 新規登録
  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true  #一意性
  validates :password, presence: true, length: { in: 7..100 }  #7文字以上100文字以下
  validates :password_confirmation, presence: true, length: { in: 7..100 }  #パスワードの再度確認
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :phone_number, presence: true
end
