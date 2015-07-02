require 'rails_helper'

feature 'User creates a snippet' do
  scenario 'successfully created' do
    create_snippet('My snippet')

    expect(page).to have_content('My snippet')
  end

  scenario 'falied to create' do
    create_snippet('')

    expect(page).to have_content("Content can't be blank")
  end

  def create_snippet(content)
    visit root_path
    click_on 'Create Snippet'

    fill_in :snippet_content, with: content
    click_on 'Save'
  end
end
