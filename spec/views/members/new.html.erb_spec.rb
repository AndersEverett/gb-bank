require 'rails_helper'

RSpec.describe "members/new.html.erb", type: :view do
  it "displays correct resource queues" do 
    assign(:member, Member.create(name: 'Fritz', email: "fz@g.com", balance: 100.00))
    render
    expect(rendered).to match('Create a New Member')
    expect(rendered).to match('email')
  end
end
