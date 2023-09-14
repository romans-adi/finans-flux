import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  select(event) {
    const selectedCategory = event.currentTarget.getAttribute('data-category');
    const nameInput = document.getElementById('category_name');
    const iconInput = document.getElementById('category_icon');
    if (nameInput && iconInput) {
      const capitalizedCategory = selectedCategory.charAt(0).toUpperCase() + selectedCategory.slice(1);
      nameInput.value = capitalizedCategory;
      iconInput.value = selectedCategory;
    }
  }
}
