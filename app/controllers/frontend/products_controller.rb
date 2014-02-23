class Frontend::ProductsController < Frontend::BaseController
  def index
    @products = Product.available.page params[:page]
  end
end
