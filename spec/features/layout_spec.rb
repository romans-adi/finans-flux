require 'rails_helper'

RSpec.describe 'Layout', type: :feature do
  it 'renders the layout template correctly' do
    visit root_path
    expect(page).to have_title('Finans Flux')
    expect(page).to have_css('meta[name="viewport"][content="width=device-width,initial-scale=1"]', visible: false)
    expect(page).to have_css('meta[name="description"][content^="FinansFlux is a robust financial application"]', visible: false)
    expect(page).to have_css('meta[name="csrf-token"]', visible: false)
    expect(page).to have_css('meta[name="csrf-param"]', visible: false)
    expect(page).to have_css('link[rel="icon"][href$="favicon.ico"]', visible: false)
    expect(page).to have_css('link[rel="stylesheet"][href*="application.css"]', visible: false)
    expect(page).to have_css('link[rel="stylesheet"][href*="tailwind.css"]', visible: false)
    expect(page).to have_css('script[data-importmap][type="importmap"]', visible: false)
    expect(page).to have_css('script[src*="application.js"][type="module"][defer]', visible: false)
  end
end
