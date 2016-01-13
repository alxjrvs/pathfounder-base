require 'rails_helper'

feature 'Editing Class' do

  scenario 'A Guest with an empty character edits their class' do
    character = create :empty_character
    visit edit_pf_class_character_path character

    select "Fighter", from: 'Choose your Class:'

    click_button "Update Character"

    expect(page).to have_content "Fighter"

  end

end
