class ExplanationBroadcastJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    ActionCable.server.broadcast 'explanations_channel', explanation: ActiveSupport::JSON.decode(render_explanation(explanation))
  end
  private
    def render_explanation(explanation)
      ApplicationController.renderer.render(partial: 'explanations/show.json.jbuilder', locals: { explanation: explanation })
    end
end
