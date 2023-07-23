class AdminController < ApplicationController
    def index
    end
  
    def users
      @users = User.all.page(params[:page]).per(20)
    end
  
    def build_orders
      @build_orders = BuildOrder.all.page(params[:page]).per(20)
    end
  
    def attack_benchmarks
      @attack_benchmarks = AttackBenchmark.all.page(params[:page]).per(20)
    end
end