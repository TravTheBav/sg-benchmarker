class BuildOrdersController < ApplicationController
    load_and_authorize_resource :user
    load_and_authorize_resource :build_order, through: :user
  
    def index
      @build_orders = BuildOrder.search(@user, params).page(params[:page]).per(10)
    end
  
    def show
    end
  
    def new
      @build_order.build_order_steps.build
    end
  
    def edit
    end
  
    def create
      respond_to do |format|
        if @build_order.save
          flash[:notice] = 'Build order saved'
          format.html { redirect_to controller: 'build_orders', action: 'show', id: @build_order.id, user_id: @build_order.user_id }
        else
          flash.now[:alert] = 'Could not save build order'
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if @build_order.update(build_order_params)
          flash[:notice] = 'Build order updated'
          format.html { redirect_to controller: 'build_orders', action: 'show', id: @build_order.id, user_id: @build_order.user_id }
        else
          flash.now[:alert] = 'Could not update build order'
          format.html { render :edit, status: :unprocessable_entity }
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
  
      # Only allow a list of trusted parameters through
      def build_order_params
        params.require(:build_order).permit(
          :name,
          :faction,
          :notes,
          build_order_steps_attributes: [:id, :supply, :unit, :description, :_destroy]
        )
      end
  end
  