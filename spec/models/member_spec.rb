require 'rails_helper'

RSpec.describe Member, type: :model do
  
  it "has a valid factory" do
    expect(FactoryGirl.create(:member)).to be_valid
  end
  
  it "is invalid without an email" do
    expect(FactoryGirl.build(:member, email: nil)).not_to be_valid
  end
  
  it "invalid without a name" do 
    member = FactoryGirl.build(:member, name: nil)
    expect(member).to_not be_valid
  end

  it "requires a unique email address" do
    member1 = FactoryGirl.create(:member, name: "Courtney", email: 'unique@email.com')
    member2 = FactoryGirl.build(:member, name: "Kurt", email: 'unique@email.com')

    expect(member1).to be_valid
    expect(member2).not_to be_valid
  end 
  
  it "has a numerical balance" do 
  	member = FactoryGirl.create(:member) 
  	expect(member.balance).to be_kind_of(Numeric)
  end

  it "has a balance of no less than -150USD" do
    member = FactoryGirl.create(:member)
    trans = -300.00
    member.compute_balance(trans)
    expect(member.balance).to eql(100.00)
  end

  it "has a running balance that reflects valid transactions" do
    member = FactoryGirl.create(:member)
    bal = member.balance
    trans1 = FactoryGirl.create(:transaction, amount: 45.60, member_id: member.id)
    member.compute_balance(trans1.amount)
    trans2 = FactoryGirl.create(:transaction, amount: 22.50, member_id: member.id)
    member.compute_balance(trans2.amount)
    expect(member.balance).to eq(bal+trans1.amount+trans2.amount)
  end

end
