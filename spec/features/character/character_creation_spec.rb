require 'rails_helper'

feature 'Character Creation' do

  scenario 'a Guest clicks on the button to make a new character' do
    visit new_character_path

    click_button "Roll!"

    expect(page).to have_link("Edit Character Info")
    expect(page).to have_link("Edit Class")
    expect(page).to have_link("Edit Race")
    expect(page).to have_link("Edit Stats")
    expect(page).to have_link("Edit Skills")
    expect(page).to have_link("Edit Feats")
    expect(page).to have_link("Edit Items")
  end

end
