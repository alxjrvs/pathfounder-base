require 'rails_helper'

feature 'Editing Race' do

  context 'A guest' do

    scenario "Makes their character a human" do
      race = create :human, ability_bonus: nil
      character = create :empty_character, race: race

      visit edit_race_character_path character
      select "Strength", from: 'human_ability_bonus'
      click_button "Become a Human!"
      expect(page).to have_content "STR: 2/-4"
    end
  end
end
