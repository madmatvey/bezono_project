class ExplanationBroadcastJobJob < ApplicationJob
  queue_as :default

  def perform(explanation)
    ActionCable.server.broadcast 'explanations_channel', explanation: render_explanation(explanation)
  end

  private
    def render_explanation(explanation)
      ApplicationController.renderer.render(partial: 'explanations/explanation', locals: { explanation: explanation })
    end
end
