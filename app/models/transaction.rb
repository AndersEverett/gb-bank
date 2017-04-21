class Transaction < ApplicationRecord
  belongs_to :member
  validates :amount, numericality: true, presence: true
  validates :member_id, :description, presence: true
  validate :check_member_balance

  def assign_member_id(email)
    member = Member.find_by_email(email)
    self.member_id = member.id if member
  end

  def check_member_balance
  	member = Member.find(self.member_id)
    if member && !member.compute_balance(self.amount)
      errors.add(:amount, "Transaction exceeds -150USD limit")
    end
  end
end
