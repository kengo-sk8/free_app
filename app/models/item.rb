class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # gem 'active_hash'を導入後、extend ActiveHash::Associations::ActiveRecordExtensionsとbelongs_to_active_hash :〇〇(モデル名)を記述する
  belongs_to :user

  has_many :category
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy
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
  :name,
  :content,
  :condition,
  :category_id,
  :size,
  :delivery_fee,
  :delivery_way,
  :prefecture,
  :delivery_date,
  :price, 
  presence: true

  def self.search(search)
    return Name.all unless search
    Name.where('text LIKE(?)', "%#{search}%")
  end

end
