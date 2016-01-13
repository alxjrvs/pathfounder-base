require 'rails_helper'

feature 'Editing General Info' do

  scenario 'A Guest with an empty character edits their character' do
    character = create :empty_character
    visit edit_general_info_character_path character

    fill_in "Name", with: "Ragnar"

    click_button "Update Character"

    expect(page).to have_content "Ragnar"

  end

end
