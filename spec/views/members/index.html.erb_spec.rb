require 'rails_helper'

RSpec.describe "members/index.html.erb", type: :view do
  	
  it "displays all members correctly" do 
    assign(:members, [Member.create(name: 'Fritz', email: "fz@g.com", balance: 100.00)])
    render
    expect(rendered).to match('Fritz')
    expect(rendered).to match('100.0')
  end
end
