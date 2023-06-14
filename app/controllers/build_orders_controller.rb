class BuildOrdersController < ApplicationController
  before_action :set_build_order, only: %i[ show edit update destroy ]
  before_action :set_user

  def index
    @build_orders = @user.build_orders
  end

  def show
  end

  def new
    @build_order = BuildOrder.new
  end

  def edit
  end

  def create
    @build_order = current_user.build_orders.new(build_order_params)

    respond_to do |format|
      if @build_order.save
        flash[:notice] = 'Build order saved'
        format.html { redirect_to controller: 'build_orders', action: 'show', id: @build_order.id, user_id: @build_order.user_id }
      else
        flash.now[:alert] = 'Build order was not saved'
        render 'new'
      end
    end
  end

  def update

    respond_to do |format|
      if @build_order.update(build_order_params)
        flash[:notice] = 'Build order updated'
        format.html { redirect_to controller: 'build_orders', action: 'show', id: @build_order.id, user_id: @build_order.user_id }
      else
        flash.now[:alert] = 'Build order was not updated'
        render 'edit'
      end
    end
  end

  def destroy
    @build_order.destroy

    respond_to do |format|
      format.html { redirect_to user_build_orders_path(user_id: current_user.id), notice: 'Build order was destroyed' }
    end
  end

  private

    def set_build_order
      @build_order = BuildOrder.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    # Only allow a list of trusted parameters through
    def build_order_params
      params.require(:build_order).permit(:name, :faction, :notes, :user_id)
    end
end
