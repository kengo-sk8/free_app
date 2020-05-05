class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :birth_year
    belongs_to_active_hash :birth_moom
    belongs_to_active_hash :birth_day     
  
  has_many :items
  has_many :comments
  has_one :address
  has_one :card 

  正規表現の代入
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  #@が必要
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/  #半角指定 ハイフンなし
  VALID_KATAKANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/  #カタカナ
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d!@#\$%\^\&*\)\(+=._-]{7,100}\z/i  #パスワード
  VALID_POSTAL_CODE = /\A\d{3}-\d{4}\z/i  #住所



  # 新規登録
  validates :nickname, presence: true  #空でないこと
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX, message: 'のフォーマットが不適切です'} #一意性(ユニーク)
  validates :password, presence: true, length: { in: 7..100 }, format: { with: VALID_PASSWORD_REGEX, message: 'は英字と数字両方を含むパスワードを設定してください'} #7文字以上100文字以下
  validates :password_confirmation, presence: true, length: { in: 7..100 }, format: { with: VALID_PASSWORD_REGEX, message: 'は英字と数字両方を含むパスワードを設定してください'} #パスワードの再度確認
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true, format: { with: VALID_KATAKANA_REGEX, message: 'はカタカナで入力して下さい'}
  validates :last_name_kana, presence: true, format: { with: VALID_KATAKANA_REGEX, message: 'はカタカナで入力して下さい'}
  validates :phone_number, presence: true
  validates :birthday_year_id, presence: true
  validates :birthday_moon_id, presence: true
  validates :birthday_day_id, presence: true

  def birthday
    "#{BirthYear.find(self.birthday_year_id).year}/#{BirthMoom.find(self.birthday_moom_id).month}/#{BirthDay.find(self.birthday_day_id).day}"
  end
end
