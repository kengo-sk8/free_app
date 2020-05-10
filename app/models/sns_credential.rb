class SnsCredential < ApplicationRecord
  belongs_to :user, optional: true, dependent: :destroy
end
