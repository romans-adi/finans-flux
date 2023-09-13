module ApplicationHelper
  def category_icon(category)
    icons = {
      shopping: 'fa-shopping-cart',
      transfers: 'fa-exchange-alt',
      transportation: 'fa-bus',
      groceries: 'fa-shopping-basket',
      services: 'fa-wrench',
      restaurants: 'fa-utensils',
      utilities: 'fa-bolt',
      cash: 'fa-money-bill-wave',
      health: 'fa-heartbeat',
      entertainments: 'fa-film'
    }

    icon_class = icons[category.name.parameterize.underscore.to_sym]

    if icon_class.present?
      content_tag(:i, nil, class: "fas #{icon_class} text-xl bg-second p-4 text-white rounded-lg")
    elsif category.icon.present? && category.icon =~ URI::DEFAULT_PARSER.regexp[:ABS_URI]
      image_tag(category.icon, class: 'w-12 h-12', alt: "#{category.name} Icon")
    end
  end
end
