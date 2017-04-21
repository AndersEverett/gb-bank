require 'rails_helper'

RSpec.describe Transaction, type: :model do
  
  it "has a numerical amount" do 
    transaction = FactoryGirl.create(:transaction) 
  	expect(transaction.amount).to be_kind_of(Numeric)
  end
  
  it "has a valid member id" do
    transaction = FactoryGirl.create(:transaction)
    member = FactoryGirl.create(:member)
    transaction.assign_member_id(member.email)
    expect(transaction.attributes).to include("member_id")
  end

  it "does not push member balance below -150USD" do 
    member = FactoryGirl.create(:member, balance: -149.00)
    transaction = FactoryGirl.build(:transaction, member_id: member.id, amount: -5.00)
    transaction.valid?
    expect(transaction.errors.size).to eq(1)
    member.compute_balance(transaction.amount)
    expect(member.balance).to eq(-149.00)
  end
end
