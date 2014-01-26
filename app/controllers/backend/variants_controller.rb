class Backend::VariantsController < Backend::BaseController
  before_action :set_variant, only: [:show, :edit, :update, :destroy]
  before_action :set_product

  # GET /variants
  # GET /variants.json
  def index
    @variants =
      if @product
        @product.variants.page params[:page]
      else
        Variant.page params[:page]
      end
  end

  # GET /variants/1
  # GET /variants/1.json
  def show
  end

  # GET /variants/new
  def new
    @variant = Variant.new
    @variant.assets.build
  end

  # GET /variants/1/edit
  def edit
    @variant.assets.build if @variant.assets.blank?
  end

  # POST /variants
  # POST /variants.json
  def create
    @variant = @product.variants.new(params.require(:variant).permit!)
    @variant.price = params[:variant][:price]
    respond_to do |format|
      if @variant.save
        format.html { redirect_to admin_product_variants_url(@product), notice: 'Variant was successfully created.' }
        format.json { render action: 'show', status: :created, location: @variant }
      else
        format.html { render action: 'new' }
        format.json { render json: @variant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /variants/1
  # PATCH/PUT /variants/1.json
  def update
    respond_to do |format|
      if @variant.update(variant_params)
        format.html { redirect_to admin_product_variants_url(@product), notice: 'Variant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @variant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /variants/1
  # DELETE /variants/1.json
  def destroy
    @variant.delete
    respond_to do |format|
      format.html { redirect_to admin_product_variants_url(@product) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:product_id]) if params[:product_id]
    end

    def set_variant
      @variant = Variant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def variant_params
      params.require(:variant).permit(:sku, :product_id, :position, :price, :variant_price, option_value_ids: [], assets_attributes: [:id, :image, :_destroy])
    end
end
