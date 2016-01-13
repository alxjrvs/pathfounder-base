require 'rails_helper'

feature 'Editing Stats' do

  scenario 'A Guest with an empty character edits their characters stats' do
    character = create :empty_character
    visit edit_stats_character_path character

    fill_in "Strength:", with: 10
    fill_in "Dexterity:", with: 10
    fill_in "Constitution:", with: 10
    fill_in "Wisdom:", with: 10
    fill_in "Intelligence:", with: 10
    fill_in "Charisma:", with: 10

    click_button "Update Character"
    
    expect(page).to have_content "STR: 10/0"
    expect(page).to have_content "DEX: 10/0"
    expect(page).to have_content "CON: 10/0"
    expect(page).to have_content "WIS: 10/0"
    expect(page).to have_content "INT: 10/0"
    expect(page).to have_content "CHA: 10/0"

  end

end
