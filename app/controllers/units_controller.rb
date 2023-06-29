class UnitsController < ApplicationController
    def destroy
        @attack_benchmark = AttackBenchmark.new(user_id: current_user.id, units: [Unit.new])
    end
end