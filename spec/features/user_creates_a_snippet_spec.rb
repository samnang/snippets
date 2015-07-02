require 'rails_helper'

feature 'User creates a snippet' do
  scenario 'successfully created' do
    visit root_path
    click_on 'Create Snippet'

    fill_in :snippet_content, with: 'My snippet'
    click_on 'Save'

    expect(page).to have_content('My snippet')
  end

  scenario 'falied to create' do
    visit root_path
    click_on 'Create Snippet'

    fill_in :snippet_content, with: ''
    click_on 'Save'

    expect(page).to have_content("Content can't be blank")
  end
end
