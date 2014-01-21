class Backend::PrototypesController < Backend::BaseController
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]

  # GET /prototypes
  # GET /prototypes.json
  def index
    @prototypes = Prototype.page params[:page]
  end

  # GET /prototypes/1
  # GET /prototypes/1.json
  def show
  end

  # GET /prototypes/new
  def new
    @prototype = Prototype.new
  end

  # GET /prototypes/1/edit
  def edit
  end

  # POST /prototypes
  # POST /prototypes.json
  def create
    @prototype = Prototype.new(prototype_params)

    respond_to do |format|
      if @prototype.save
        format.html { redirect_to [:admin, @prototype], notice: 'Prototype was successfully created.' }
        format.json { render action: 'show', status: :created, location: @prototype }
      else
        format.html { render action: 'new' }
        format.json { render json: @prototype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prototypes/1
  # PATCH/PUT /prototypes/1.json
  def update
    respond_to do |format|
      if @prototype.update(prototype_params)
        format.html { redirect_to [:admin, @prototype], notice: 'Prototype was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @prototype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prototypes/1
  # DELETE /prototypes/1.json
  def destroy
    @prototype.destroy
    respond_to do |format|
      format.html { redirect_to admin_prototypes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prototype
      @prototype = Prototype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prototype_params
      params.require(:prototype).permit(:name, :property_ids => [], :option_type_ids => [])
    end
end
