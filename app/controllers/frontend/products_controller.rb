class Frontend::ProductsController < Frontend::BaseController
  def index
    @products = Product.available.page(params[:page]).per(params[:per] || 10)
  end

  def show
    @product = Product.find(params[:id])
  end
end
