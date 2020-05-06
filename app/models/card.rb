class Card < ApplicationRecord
  belongs_to :user

  # < 空でないか >
  validates :user_id,
            :card_id,
            :customer_id,presence: true
  # < 重複してないかどうか >
  validates :user_id,uniqueness: true
end
