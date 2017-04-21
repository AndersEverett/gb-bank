require 'rails_helper'

RSpec.describe "transactions/new.html.erb", type: :view do
  it "displays transaction form" do 
    assign(:transaction, FactoryGirl.build(:transaction))
    render
    expect(rendered).to match('transaction date')
    expect(rendered).to match("member email")
    expect(rendered).to match('description')
  end
end
