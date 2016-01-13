require 'rails_helper'

feature 'Editing Skills' do

  scenario 'A Guest with an empty character edits their characters skills' do
    character = create :empty_character
    visit edit_skills_character_path character

    fill_in "Climb:", with: 1
    fill_in "Craft 1 Name:", with: "Cobbling"
    fill_in "Craft 1 Value:", with: 1

    click_button "Update Character"
    
    expect(page).to have_content "Climb: 1"
    expect(page).to have_content "Cobbling: 1"
  end

end
