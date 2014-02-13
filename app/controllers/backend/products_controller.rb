class Backend::ProductsController < Backend::BaseController
  before_action :set_product, only: [:show, :edit, :edit_detail, :update, :destroy, :restore, :product_properties]

  # GET /products
  # GET /products.json
  def index
    @products = Product.search(params[:keyword]).page params[:page]
  end


  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to admin_products_url, notice: 'Product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to admin_products_url, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.delete
    respond_to do |format|
      format.html { redirect_to admin_products_url }
      format.json { head :no_content }
    end
  end

  def trash
    @products = Product.only_deleted.page params[:page]
    render :file => 'backend/products/index'
  end

  def restore
    @product.restore
    respond_to do |format|
      format.html { redirect_to admin_products_url, notice: 'Product was successfully restored.' }
      format.json { head :no_content }
    end
  end

  def product_properties
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.with_deleted.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit!
    end
end
