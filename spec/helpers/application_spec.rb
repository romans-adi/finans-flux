require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#category_icon' do
    it 'returns a font-awesome icon when category has a valid icon' do
      category = double(icon: 'fa-shopping-cart', name: 'Shopping')
      icon_html = helper.category_icon(category)

      expect(icon_html).to include('<i')
      expect(icon_html).to include('class="fas fa-shopping-cart text-xl bg-second p-4 text-white rounded-lg"')
    end

    it 'returns a default font-awesome icon when category has an invalid icon' do
      category = double(icon: 'invalid-icon', name: 'Invalid Category')
      icon_html = helper.category_icon(category)

      expect(icon_html).to include('<i')
      expect(icon_html).to include('class="fas fa-money-bill-wave text-xl bg-second p-4 text-white rounded-lg"')
    end

    it 'returns an image tag when category has a valid icon and name' do
      category = double(icon: 'custom-icon.png', name: 'Custom Category')
      icon_html = helper.category_icon(category)

      expect(icon_html).to include('<img')
      expect(icon_html).to include('src="custom-icon.png"')
      expect(icon_html).to include('alt="Custom Category Icon"')
    end

    it 'returns a "No Icon" span when category has no icon or name' do
      category = double(icon: nil, name: nil)
      icon_html = helper.category_icon(category)

      expect(icon_html).to include('<span')
      expect(icon_html).to include('class="text-red-500"')
      expect(icon_html).to include('No Icon')
    end
  end
end
