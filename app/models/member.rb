class Member < ApplicationRecord
  has_many :transactions
  validates :name, presence: { strict: true }
  validates :email, uniqueness: true, presence: true
  validates :balance, numericality: { greater_than_or_equal_to: -150.00 }	


  def compute_balance(transaction_amount)
    self.balance += transaction_amount
    self.save!
  end
end
