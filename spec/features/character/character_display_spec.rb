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
      end
    end
  end

end
