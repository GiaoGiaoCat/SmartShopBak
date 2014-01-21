class Backend::ShippingMethodsController < Backend::BaseController
  before_action :set_shipping_method, only: [:show, :edit, :update, :destroy]

  # GET /shipping_methods
  # GET /shipping_methods.json
  def index
    @shipping_methods = ShippingMethod.page params[:page]
  end

  # GET /shipping_methods/1
  # GET /shipping_methods/1.json
  def show
  end

  # GET /shipping_methods/new
  def new
    @shipping_method = ShippingMethod.new
  end

  # GET /shipping_methods/1/edit
  def edit
  end

  # POST /shipping_methods
  # POST /shipping_methods.json
  def create
    @shipping_method = ShippingMethod.new(shipping_method_params)
    respond_to do |format|
      if @shipping_method.save
        format.html { redirect_to [:admin, @shipping_method], notice: 'Shipping method was successfully created.' }
        format.json { render action: 'show', status: :created, location: @shipping_method }
      else
        format.html { render action: 'new' }
        format.json { render json: @shipping_method.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shipping_methods/1
  # PATCH/PUT /shipping_methods/1.json
  def update
    respond_to do |format|
      if @shipping_method.update(shipping_method_params)
        format.html { redirect_to [:admin, @shipping_method], notice: 'Shipping method was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @shipping_method.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shipping_methods/1
  # DELETE /shipping_methods/1.json
  def destroy
    @shipping_method.destroy
    respond_to do |format|
      format.html { redirect_to admin_shipping_methods_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipping_method
      @shipping_method = ShippingMethod.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shipping_method_params
      # params.require(:shipping_method).permit(:name, :admin_name, :display_on, :shipping_categories)
      params.require(:shipping_method).permit(:name, :admin_name, :display_on, :shipping_category_ids => [])
    end
end
