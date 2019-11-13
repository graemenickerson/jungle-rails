class Admin::DashboardController < ApplicationController


  def show
    @num_products = Product.count(:id)
    @num_categories = Category.count(:id)
  end
end
