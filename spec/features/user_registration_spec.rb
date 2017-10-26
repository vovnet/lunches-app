require 'rails_helper'

feature 'Guest can register. The first user becomes the admin.' do 
  scenario 'Guest try to sign up as a first user' do 
    User.delete_all
  end

  scenario 'Guest try to sign up as second user' do 

  end
end