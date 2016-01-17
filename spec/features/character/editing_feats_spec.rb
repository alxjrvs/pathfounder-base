require 'rails_helper'

feature 'Editing feats' do

  scenario 'A Guest with an empty character edits their characters feats' do
    character = create :empty_character
    visit edit_feats_character_path character
    feat = Feats.names.sample

    check feat

    click_button "Update Character"

    expect(page).to have_content feat
  end
end
