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
        within "#header" do
          expect(page).to have_content name
        end
      end

      scenario 'and sees their character\'s class.' do
        within "#header" do
          expect(page).to have_content "Fighter"
        end
      end

      scenario 'and sees their character\'s race.' do
        within "#header" do
          expect(page).to have_content "Human"
        end
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
        expect(page).to have_content "Strength 18 4"
        expect(page).to have_content "Dexterity 12 1"
        expect(page).to have_content "Constitution 14 2"
        expect(page).to have_content "Wisdom 7 -2"
        expect(page).to have_content "Intelligence 11 0"
        expect(page).to have_content "Charisma 13 1"
      end
    end

    context "(with nothing filled out)" do
      let!(:character) { create :empty_character }
      scenario 'and sees nil info' do
        visit character_path character
        expect(page).to have_content "(No Name!)"
        expect(page).to have_content "(No Class!)"
        expect(page).to have_content "(No Race!)"
        expect(page).to have_content "Strength 0 -5"
        expect(page).to have_content "Dexterity 0 -5"
        expect(page).to have_content "Constitution 0 -5"
        expect(page).to have_content "Wisdom 0 -5"
        expect(page).to have_content "Intelligence 0 -5"
        expect(page).to have_content "Charisma 0 -5"
        expect(page).to have_content "(No Skills!)"
        expect(page).to have_content "(No Feats!)"
      end
    end
  end
end
