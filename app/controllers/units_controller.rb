class UnitsController < ApplicationController
    before_action :setup_attack_benchmark

    def new
    end

    def destroy
    end

    private

        def setup_attack_benchmark
            @attack_benchmark = AttackBenchmark.new(user_id: current_user.id, units: [Unit.new])
        end
end