class Item < ApplicationRecord
  belongs_to :user,optional: true
  belongs_to :category
  has_many :comments

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
end
