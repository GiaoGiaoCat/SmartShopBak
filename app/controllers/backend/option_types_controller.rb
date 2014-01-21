class Backend::OptionTypesController < Backend::BaseController
  before_action :set_option_type, only: [:show, :edit, :update, :destroy]

  # GET /option_types
  # GET /option_types.json
  def index
    @option_types = OptionType.page params[:page]
  end

  # GET /option_types/1
  # GET /option_types/1.json
  def show
  end

  # GET /option_types/new
  def new
    @option_type = OptionType.new
    @option_type.option_values.build
  end

  # GET /option_types/1/edit
  def edit
    @option_type.option_values.build if @option_type.option_values.blank?
  end

  # POST /option_types
  # POST /option_types.json
  def create
    @option_type = OptionType.new(option_type_params)

    respond_to do |format|
      if @option_type.save
        format.html { redirect_to [:admin, @option_type], notice: 'Option type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @option_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @option_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /option_types/1
  # PATCH/PUT /option_types/1.json
  def update
    respond_to do |format|
      if @option_type.update(option_type_params)
        format.html { redirect_to [:admin, @option_type], notice: 'Option type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @option_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /option_types/1
  # DELETE /option_types/1.json
  def destroy
    @option_type.destroy
    respond_to do |format|
      format.html { redirect_to admin_option_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_option_type
      @option_type = OptionType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def option_type_params
      params.require(:option_type).permit(:name, :presentation, :position, option_values_attributes: [:id, :name, :presentation, :_destroy])
    end
end
