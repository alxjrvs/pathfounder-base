require 'rails_helper'

feature 'Editing Race' do

  scenario 'A Guest with an empty character edits their characters race' do
    character = create :empty_character
    visit edit_race_character_path character

    select "Human", from: 'Choose your Race:'

    click_button "Update Character"

    expect(page).to have_content "Human"
  end

  scenario 'A Guest with a human character chooses an ability mod' do
    race = create :human, ability_bonus: nil
    character = create :empty_character, race: race

    visit edit_race_character_path character

    select "Strength", from: 'Choose your Human Ability Bonus Stat:'

    click_button "Update Character"

    expect(page).to have_content "Human"
  end

end
