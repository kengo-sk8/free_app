class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user,optional: true

  has_many :category
  has_many :comments
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  # belongs_to :category
  
  belongs_to_active_hash :condition, resence: true
  belongs_to_active_hash :size, presence: true
  belongs_to_active_hash :delivery_date, presence: true
  belongs_to_active_hash :delivery_fee, presence: true
  belongs_to_active_hash :prefecture, presence: true
  belongs_to_active_hash :delivery_way, presence: true


  validates :images,
  :name,
  :content,
  :condition,
  # :category_id,
  :size,
  :delivery_fee,
  :delivery_way,
  :prefecture,
  :delivery_date,
  :price, 
  presence: true


end
