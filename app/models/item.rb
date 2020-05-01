class Item < ApplicationRecord
  has_many :comments
  belongs_to :user
  has_many :images, dependent: :destroy

  accepts_nested_attributes_for :images
end
