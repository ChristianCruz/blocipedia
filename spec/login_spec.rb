require 'rails_helper'

describe 'User sign in' do
  # @request.env["devise.mapping"] = Devise.mappings[:user]

  sign_in FactoryGirl.create(:user)

  expect(page).to have_content('Signed in succesfully')
end