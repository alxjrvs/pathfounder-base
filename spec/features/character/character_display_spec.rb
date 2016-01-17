require 'rails_helper'

feature 'Character Display' do

  context 'a Guest views their character' do
    context '(Which is filled out!)' do
      let(:name) { "Ragnar" }
      let(:race) { create :human, ability_bonus: :strength }
      let(:skill_list) { create :skill_list } 
      let(:stat_block) { create :stat_block } 
      let(:feat_list) { create :feat_list } 
      let!(:character) do
        create :empty_character, 
          skill_list: skill_list, 
          stat_block: stat_block,
          feat_list: feat_list,
          race: race,
          name: name
      end
      let(:fighter) { create :fighter } 
      let!(:level) { create :level, character: character, pf_class: fighter } 

      before do
        visit character_path character
      end

      scenario 'and sees their character\'s name.' do
        expect(page).to have_content name
      end

      scenario 'and sees their character\'s class.' do
        expect(page).to have_content "Fighter"
      end

      scenario 'and sees their character\'s race.' do
        expect(page).to have_content "Human"
      end

      scenario 'and sees the name on the show page' do
        expect(page).to have_content "Acrobatics: 1"
        expect(page).to have_content "Woodworking: 1"
      end

      scenario 'and sees their character\'s Feat(s).' do
        character.feat_list.list.each do |feat|
          expect(page).to have_content feat
        end
      end

      scenario 'and sees their character\'s stats' do
        expect(page).to have_content "STR: 18/4"
        expect(page).to have_content "DEX: 12/1"
        expect(page).to have_content "CON: 14/2"
        expect(page).to have_content "WIS: 7/-2"
        expect(page).to have_content "INT: 11/0"
        expect(page).to have_content "CHA: 13/1"
      end
    end

    context "(with nothing filled out)" do
      let!(:character) { create :empty_character }
      scenario 'and sees nil info' do
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
        expect(page).to have_content "(No Feats!)"
      end
    end
  end
end
