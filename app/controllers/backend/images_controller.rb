class Backend::ImagesController < Backend::BaseController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  before_action :load_data

  # GET /images
  # GET /images.json
  def index
    @images =
      if @product
        @product.variant_images.page params[:page]
      else
        Image.page params[:page]
      end
  end

  # GET /images/1
  # GET /images/1.json
  def show
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  # POST /images.json
  def create
    create_image

    respond_to do |format|
      if @image.save
        format.html { redirect_to admin_product_images_url(@product), notice: 'Image was successfully created.' }
        format.json { render action: 'show', status: :created, location: admin_product_image_url(@product, @image) }
      else
        format.html { render action: 'new' }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to admin_product_images_url(@product), notice: 'Image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to admin_product_images_url(@product) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def load_data
      @product = Product.find(params[:product_id]) if params[:product_id]
      @variants = @product.variants.collect do |variant|
        [variant.sku_and_options_text, variant.id]
      end
      @variants.insert(0, ["ALL", @product.master.id])
    end

    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit!
    end

    def create_image
      @image =
        if request.xhr?
          @product.attachments.new({image: params["Filedata"]})
        else
          Image.new(image_params)
        end
    end
end
