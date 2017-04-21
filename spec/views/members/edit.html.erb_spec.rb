require 'rails_helper'

RSpec.describe "members/edit.html.erb", type: :view do
  it "displays members pre-existing info" do 
    assign(:member, Member.create(name: 'Fritz', email: "fz@g.com", balance: 100.00))
    render
    expect(rendered).to match('Fritz')
    expect(rendered).to match("fz@g.com")
    expect(rendered).to match('Update Member')
  end
end
