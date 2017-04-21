require 'spec_helper'
require 'rails_helper'

feature "New Transaction Form" do
  scenario "should be submittable from the transactions/create page" do
    member = Member.create(name: "Phil Jones", email: "P@j.com", balance: 2390)
    transaction = Transaction.new(transaction_date: DateTime.now)
        visit '/transactions/create'
        fill_in 'amount', with: 40.00
        fill_in "member email", with: member.email
        fill_in "description", with: transaction.description
        # fill_in 'transaction date', with: "2017/04/21"
        click_button 'Create Transaction'
        expect(page).to have_content 'Members'
  end
end

feature "New Member Form" do
  scenario "should be submittable from the transactions/create page" do
    member = Member.new()
        visit '/members/create'
        fill_in 'name', with: "Anders"
        fill_in "email", with: "a@h.com"
        click_button 'Create Member'
        expect(page).to have_content 'Members'
  end
end

feature "Edit Member Form" do
  scenario "should be submittable from the members/[:id]/edit page" do
    member = Member.create(name: "Jessica", email: "j@cool.com")
    id = member.id
        visit "/members/#{id}/edit"
        fill_in 'name', with: "Queen Jessica"
        fill_in "email", with: "j@thecoolest.com"
        click_button 'Update Member'
        expect(page).to have_content 'Members'
  end
end

