require 'spec_helper'

feature 'View the new observation page' do
  scenario 'user see relavent information' do
    visit new_observation_path
    expect(page).to have_css 'title', text: 'Birdr'
  end
end