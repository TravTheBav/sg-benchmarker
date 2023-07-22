class BuildOrderStepsController < ApplicationController
    before_action :setup_build_order
    
    def new
    end

    def destroy
    end

    private

        def setup_build_order
            @build_order = BuildOrder.new(user_id: current_user.id, build_order_steps: [BuildOrderStep.new])
        end
end