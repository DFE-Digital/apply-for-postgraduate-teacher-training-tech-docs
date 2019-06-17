require 'spec_helper'

RSpec.describe 'following resource links', type: :feature do
  scenario 'clicking the "Candidate" link in the "Application" attributes list' do
    visit '/'

    click_on 'Retrieve a single application'
    within 'table' do
      click_on 'Candidate'
    end

    expect(page).to have_content 'The unique ID of this candidate'
  end
end
