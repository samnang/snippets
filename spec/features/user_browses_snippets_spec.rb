require 'rails_helper'

feature 'Browse snippets' do
  scenario 'on home page' do
    Snippet.create(content: 'My snippet')

    visit root_path

    expect(page).to have_content('My snippet')
  end
end
