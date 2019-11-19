require 'rails_helper'

RSpec.feature "Visitor navigates to product page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )

  end

  scenario "They click on a details button and get a page with the product's details." do
    # ACT
    visit root_path
    within 'article footer' do
      click_on "Details"
    end

    # DEBUG / VERIFY
    expect(page).to have_content "Quantity"
  end

end