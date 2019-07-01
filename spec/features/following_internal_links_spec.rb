require 'spec_helper'

describe 'following internal links', type: :feature do
  scenario 'clicking the "Contact details" link in the "Application" attributes list' do
    visit '/'

    click_on 'Retrieve a single application'
    within 'table' do
      click_on 'Candidate'
    end

    expect(page).to have_content 'The candidate’s phone number'
  end

  scenario 'clicking the "Usage scenarios" link on the front page' do
    visit '/'

    within '#content' do
      click_on 'usage scenarios'
    end

    expect(page).to have_content 'A successful application'
  end
end
