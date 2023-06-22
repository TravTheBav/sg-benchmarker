class BuildOrderStepsController < ApplicationController
    def destroy
        @build_order = BuildOrder.new(user_id: current_user.id, build_order_steps: [BuildOrderStep.new])
    end
end