class ExplanationBroadcastJob < ApplicationJob
  queue_as :default

  def perform(explanation)
    # Do something later
    ActionCable.server.broadcast 'ExplanationsChannel',
      explanation: ActiveSupport::JSON.decode(render_explanation(explanation))
    puts "
    SEND broadcast msg: #{args}

    ActiveSupport::JSON.decode(render_explanation(args)): #{ActiveSupport::JSON.decode(render_explanation(explanation))}

    "
  end
  private
    def render_explanation(explanation)
      ApplicationController.renderer.render(partial: 'explanations/explanation.json.jbuilder', locals: { explanation: explanation })
    end
end
