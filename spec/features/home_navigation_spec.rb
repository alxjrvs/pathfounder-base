require 'rails_helper'

feature 'Home Navigation' do
  scenario 'a Guest visits the root' do

    visit root_path

    expect(page.current_path).to eq "/"
  end
end
