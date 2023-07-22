class AttackBenchmarksController < ApplicationController
    load_and_authorize_resource :user
    load_and_authorize_resource :attack_benchmark, through: :user
  
    # GET /attack_benchmarks or /attack_benchmarks.json
    def index
      @attack_benchmarks = AttackBenchmark.search(@user, params).page(params[:page]).per(10)
    end
  
    # GET /attack_benchmarks/1 or /attack_benchmarks/1.json
    def show
    end
  
    # GET /attack_benchmarks/new
    def new
      @attack_benchmark.units.build
    end
  
    # GET /attack_benchmarks/1/edit
    def edit
    end
  
    # POST /attack_benchmarks or /attack_benchmarks.json
    def create
      respond_to do |format|
        if @attack_benchmark.save
          flash[:notice] = 'Benchmark saved'
          format.html { redirect_to controller: 'attack_benchmarks', action: 'show', id: @attack_benchmark.id, user_id: @attack_benchmark.user_id }
        else
          flash.now[:alert] = 'Could not save benchmark'
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if @attack_benchmark.update(attack_benchmark_params)
          flash[:notice] = 'Benchmark updated'
          format.html { redirect_to controller: 'attack_benchmarks', action: 'show', id: @attack_benchmark.id, user_id: @attack_benchmark.user_id }
        else
          flash.now[:alert] = 'Could not update benchmark'
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @attack_benchmark.destroy
  
      respond_to do |format|
        format.html { redirect_to user_attack_benchmarks_path(user_id: current_user.id), notice: 'Benchmark was destroyed' }
      end
    end
  
    private
    
      # Only allow a list of trusted parameters through.
      def attack_benchmark_params
        params.require(:attack_benchmark).permit(
          :build_order,
          :time,
          :map,
          :notes,
          :match_outcome,
          units_attributes: [:id, :unit_type, :quantity, :_destroy]
        )
      end
end