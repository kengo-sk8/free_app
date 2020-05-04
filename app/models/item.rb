class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user,optional: true

  has_many :comments
  # belongs_to :category
  
  belongs_to_active_hash :condition, resence: true
  belongs_to_active_hash :delivery_date, presence: true
  belongs_to_active_hash :delivery_fee, presence: true
  belongs_to_active_hash :prefecture, presence: true
  belongs_to_active_hash :delivery_way, presence: true
  # belongs_to_active_hashには全て ,presence: trueを記述する事！

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
end
