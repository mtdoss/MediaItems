require 'spec_helper'

feature 'the signup process' do
  it 'has a new user page' do
    visit new_user_url
    expect(page).to have_content "Sign Up!"
  end 

  it 'shows username on the homepage after signup' do
    sign_up as('mark')
    expect(page).to have_content "mark"
  end
end

feature 'logging in' do 
  let!(:mark) { FactoryGirl.create(:user_mark) }

  it 'shows username on the homepage after logging in' do
    login_as(mark)
    expect(page).to have_content('mark')
  end 
end

