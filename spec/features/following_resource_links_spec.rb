require 'spec_helper'

describe 'following resource links', type: :feature do
  scenario 'clicking the "Contact details" link in the "Application" attributes list' do
    visit '/'

    click_on 'Retrieve a single application'
    within 'table' do
      click_on 'Candidate'
    end

    expect(page).to have_content 'The candidate’s phone number'
  end
end
