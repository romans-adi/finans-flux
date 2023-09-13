require 'rails_helper'

RSpec.describe 'Layout', type: :feature do
  it 'renders the layout template correctly' do
    visit root_path
    expect(page).to have_title('Finans Flux')
    expect(page).to have_css('html')
    expect(page).to have_css('body')
    expect(page).to have_css('main')
  end
end
