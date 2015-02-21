require 'rails_helper'
require 'spec_helper'

feature 'the signup process' do
  it 'has a new user page' do
    visit new_user_url
    expect(page).to have_content "Sign Up!"
  end 

  it 'shows username on the homepage after signup' do
    sign_up_as('mark')
    expect(page).to have_content "mark"
  end
end

feature 'logging in' do 
  let!(:mark) { FactoryGirl.create(:user_mark) }

  it 'shows username on the homepage after logging in' do
    login_as(mark)
    expect(page).to have_content 'mark'
  end 
end

feature 'logging out' do
  let!(:mark) {FactoryGirl.create(:user_mark) }

  it 'begins with logged out state' do
    visit root_url
    expect(page).to have_content "Log In"
  end

  it 'Doesnt show username on homepage after logout' do
    login_as(mark)
    click_button "Log Out"
    expect(page).not_to have_content "mark"
  end
end
