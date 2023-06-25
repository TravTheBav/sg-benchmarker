class AttackBenchmarksController < ApplicationController
  before_action :set_attack_benchmark, only: %i[ show edit update destroy ]

  # GET /attack_benchmarks or /attack_benchmarks.json
  def index
    @attack_benchmarks = AttackBenchmark.all
  end

  # GET /attack_benchmarks/1 or /attack_benchmarks/1.json
  def show
  end

  # GET /attack_benchmarks/new
  def new
    @attack_benchmark = AttackBenchmark.new
  end

  # GET /attack_benchmarks/1/edit
  def edit
  end

  # POST /attack_benchmarks or /attack_benchmarks.json
  def create
    @attack_benchmark = AttackBenchmark.new(attack_benchmark_params)

    respond_to do |format|
      if @attack_benchmark.save
        format.html { redirect_to attack_benchmark_url(@attack_benchmark), notice: "Attack benchmark was successfully created." }
        format.json { render :show, status: :created, location: @attack_benchmark }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @attack_benchmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attack_benchmarks/1 or /attack_benchmarks/1.json
  def update
    respond_to do |format|
      if @attack_benchmark.update(attack_benchmark_params)
        format.html { redirect_to attack_benchmark_url(@attack_benchmark), notice: "Attack benchmark was successfully updated." }
        format.json { render :show, status: :ok, location: @attack_benchmark }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @attack_benchmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attack_benchmarks/1 or /attack_benchmarks/1.json
  def destroy
    @attack_benchmark.destroy

    respond_to do |format|
      format.html { redirect_to attack_benchmarks_url, notice: "Attack benchmark was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attack_benchmark
      @attack_benchmark = AttackBenchmark.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attack_benchmark_params
      params.require(:attack_benchmark).permit(:time, :map, :notes, :user_id, :build_order_id)
    end
end
