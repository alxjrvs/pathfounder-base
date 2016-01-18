require 'rails_helper'

feature 'Editing Stats' do

  scenario 'A Guest with an empty character edits their characters stats' do
    character = create :empty_character
    visit edit_stats_character_path character

    fill_in "Strength:", with: 18
    fill_in "Dexterity:", with: 12
    fill_in "Constitution:", with: 14
    fill_in "Wisdom:", with: 7
    fill_in "Intelligence:", with: 11
    fill_in "Charisma:", with: 13

    click_button "Update Character"
    
    expect(page).to have_content "Strength 18 4"
    expect(page).to have_content "Dexterity 12 1"
    expect(page).to have_content "Constitution 14 2"
    expect(page).to have_content "Wisdom 7 -2"
    expect(page).to have_content "Intelligence 11 0"
    expect(page).to have_content "Charisma 13 1"

  end

end
