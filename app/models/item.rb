class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user,optional: true

  belongs_to :category
  has_many :comments
  belongs_to_active_hash :condition

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
end
