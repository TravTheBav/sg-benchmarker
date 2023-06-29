class AttackBenchmarksController < ApplicationController
  load_and_authorize_resource :user
  load_and_authorize_resource :attack_benchmark, through: :user

  # GET /attack_benchmarks or /attack_benchmarks.json
  def index
    @attack_benchmarks = @user.attack_benchmarks
  end

  # GET /attack_benchmarks/1 or /attack_benchmarks/1.json
  def show
  end

  # GET /attack_benchmarks/new
  def new
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
        render 'new'
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
        render 'edit'
      end
    end
  end

  def destroy
    @attack_benchmark.destroy

    respond_to do |format|
      format.html { redirect_to attack_benchmarks_url, notice: "Attack benchmark was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def attack_benchmark_params
      params.require(:attack_benchmark).permit(
        :time,
        :map,
        :notes,
        :match_outcome)
    end
end
