class Backend::OrdersController < Backend::BaseController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.by_state(params[:state]).search(params[:keyword]).page params[:page]
    respond_to do |format|
      format.html
      format.json
      format.csv { send_data @orders.to_csv }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @order.build_ship_address
    @order.line_items.build
  end

  # GET /orders/1/edit
  def edit
    @order.build_ship_address if @order.ship_address.blank?
    @order.line_items.build if @order.line_items.blank?
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    respond_to do |format|
      if @order.save
        persist_order_address
        format.html { redirect_to [:admin, @order], notice: 'Order was successfully created.' }
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        persist_order_address
        format.html { redirect_to [:admin, @order], notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def change_states
    @orders = Order.where(:id => params[:ids])
    @orders.change_state(params[:state])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:special_instructions, :shipping_method_id, line_items_attributes: [:id, :variant_id, :price, :quantity, :_destroy])
    end

    def address_params
      params.require(:order).require(:ship_address_attributes).permit(:name, :phone, :address)
    end

    def persist_order_address
      @order.persist_address(address_params)
    end
end
