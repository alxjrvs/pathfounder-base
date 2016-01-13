require 'rails_helper'

feature 'Character Display' do

  context 'a Guest views their character' do
    context "with a class" do
      let(:fighter) { create :fighter } 
      let!(:character) { create :empty_character }
      let!(:level) { create :level, character: character, pf_class: fighter } 
      scenario 'and sees the class on the show page' do
        visit character_path character

        expect(page).to have_content "Fighter"
      end
    end

    context "with a race" do
      let(:race) { create :human }
      let!(:character) { create :empty_character, race: race }
      scenario 'and sees the race on the show page' do
        visit character_path character

        expect(page).to have_content "Human"
      end
    end

    context "with skills" do
      let(:skill_list) { create :skill_list } 
      let!(:character) { create :empty_character, skill_list: skill_list }
      scenario 'and sees the name on the show page' do
        visit character_path character

        expect(page).to have_content "Acrobatics: 1"
        expect(page).to have_content "Woodworking: 1"
      end
    end
    context "with stats" do
      let(:stat_block) { create :stat_block } 
      let!(:character) { create :empty_character, stat_block: stat_block }
      scenario 'and sees the name on the show page' do
        visit character_path character

        expect(page).to have_content "STR: 16/3"
        expect(page).to have_content "DEX: 12/1"
        expect(page).to have_content "CON: 14/2"
        expect(page).to have_content "WIS: 7/-2"
        expect(page).to have_content "INT: 11/0"
        expect(page).to have_content "CHA: 13/1"
      end
    end

    context "with a name" do
      let(:name) { "Ragnar" }
      let!(:character) { create :empty_character, name: name }
      scenario 'and sees the name on the show page' do
        visit character_path character

        expect(page).to have_content name
      end
    end

    context "with no information" do
      let!(:character) { create :empty_character }
      scenario 'and sees no info' do
        visit character_path character
        expect(page).to have_content "(No Name!)"
        expect(page).to have_content "(No Class!)"
        expect(page).to have_content "(No Race!)"
        expect(page).to have_content "STR: 0/-5"
        expect(page).to have_content "DEX: 0/-5"
        expect(page).to have_content "CON: 0/-5"
        expect(page).to have_content "WIS: 0/-5"
        expect(page).to have_content "INT: 0/-5"
        expect(page).to have_content "CHA: 0/-5"
        expect(page).to have_content "(No Skills!)"
      end
    end
  end

end
