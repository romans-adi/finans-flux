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
      entertaiments: 'fa-film'
    }

    icon_class = icons[category.icon.to_sym] || category.icon

    if icon_class.in?(%w[fa-shopping-cart fa-exchange-alt fa-bus fa-shopping-basket fa-wrench fa-utensils fa-bolt fa-money-bill-wave fa-heartbeat fa-film])
      content_tag(:i, nil, class: "fas #{icon_class} text-xl bg-second p-4 text-white rounded-lg")
    else
      image_tag(icon_class, class: 'w-12 h-12', alt: "#{category.name} Icon")
    end
  end
end
