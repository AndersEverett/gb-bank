class Member < ApplicationRecord
  has_many :transactions
  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :balance, numericality: { greater_than_or_equal_to: -150.00 }	


  def compute_balance(transaction_amount)
  	if (self.balance + transaction_amount) < -150.00
      return false
    else
      self.balance += transaction_amount
      self.save!
    end
  end

end
