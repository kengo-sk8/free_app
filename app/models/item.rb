class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # gem 'active_hash'を導入したら、extend ActiveHash::Associations::ActiveRecordExtensionsとbelongs_to_active_hash :〇〇(モデル名)を記述する
  belongs_to :user

  has_many :category
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :likes, dependent: :destroy
  # 下記２行ははいいね機能のアソシエーション
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  accepts_nested_attributes_for :images, allow_destroy: true
  # allow_destroy: true ： 親のレコードが削除された際、関連付いている子のレコードも一緒に削除してくれます。(公式ドキュメント有ります)
  # accepts_nested_attributes_forは、paramsの○○s_attritbutes:というキーの中で特定の値を送ることで、親モデルに紐づいた子モデルの削除、更新が出来る。
  # この特定の値が送れるよう、JavaScriptの実装を行います。

  belongs_to_active_hash :condition, resence: true 
  belongs_to_active_hash :size, presence: true
  belongs_to_active_hash :delivery_date, presence: true
  belongs_to_active_hash :delivery_fee, presence: true
  belongs_to_active_hash :prefecture, presence: true
  belongs_to_active_hash :delivery_way, presence: true
  # belongs_to_active_hashメソッドを記述する事で、各モデル(〇〇.rb)とアソシエーションを定義出来る。

  validates :images,
  :condition,
  :category_id,
  :size,
  :delivery_fee,
  :delivery_way,
  :prefecture,
  :delivery_date,
  presence: true
  validates :name, presence: true, length: {maximum: 40} #商品名を40文字以上打てない様に設置した。
  validates :content,presence: true, length: {maximum: 1000} #商品説明が1000文字しか打てない様に設定した
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 300} #300円以下の金額は入力出来ない様に設定した
  

  def self.search(search)
    if search
      Item.where('name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
  # scope :name, -> (search){ where('name LIKE(?)', "%#{search}%")}
end
