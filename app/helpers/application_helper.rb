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
      entertaiments: 'fa-film',
      default: 'fa-question-circle'
    }

    icon_key = category.icon&.to_sym
    icon_class = icons[icon_key] || icons[:default]

    if icon_class.in?(%w[fa-shopping-cart fa-exchange-alt fa-bus fa-shopping-basket fa-wrench fa-utensils fa-bolt fa-money-bill-wave fa-heartbeat fa-film])
      content_tag(:i, nil, class: "fas #{icon_class} text-xl bg-second p-4 text-white rounded-lg")
    elsif icon_class.present? && category.name.present?
      image_tag(icon_class, class: 'w-12 h-12', alt: "#{category.name} Icon")
    else
      content_tag(:span, 'No Icon', class: 'text-red-500')
    end
  end
end
