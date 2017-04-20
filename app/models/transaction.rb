class Transaction < ApplicationRecord
  belongs_to :member
  validates :amount, numericality: true, presence: true
  validates :member_id, :description, presence: true

end
