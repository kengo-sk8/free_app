class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  
  
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :birth_year
    belongs_to_active_hash :birth_moom
    belongs_to_active_hash :birth_day     
  
  has_many :items, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :address, dependent: :destroy
  has_many :sns_credentials, dependent: :destroy
  has_one :card 

  # バリデーション 
  validates :password,length: { minimum: 7}
  validates :nickname, presence: true  #空でないこと
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true, format: {with:/\A[ァ-ヶー－]+\z/}
  validates :last_name_kana, presence: true, format: {with:/\A[ァ-ヶー－]+\z/}
  validates :birthday_year_id, presence: true
  validates :birthday_moon_id, presence: true
  validates :birthday_day_id, presence: true


  def birthday
    "#{BirthYear.find(self.birthday_year_id).year}/#{BirthMoom.find(self.birthday_moom_id).month}/#{BirthDay.find(self.birthday_day_id).day}"
  end

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    if user.persisted?  #userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }  #User.form_omniauth、メゾットでuserとsnsをハッシュで返す
  end

end
