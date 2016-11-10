class ExplanationBroadcastJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    ActionCable.server.broadcast 'ExplanationsChannel',
      explanation: ActiveSupport::JSON.decode(render_explanation(args[0]))
    puts "
    SEND broadcast msg: #{args}

    ActiveSupport::JSON.decode(render_explanation(args)): #{ActiveSupport::JSON.decode(render_explanation(args[0]))}

    "
  end
  private
    def render_explanation(explanation)
      ApplicationController.renderer.render(partial: 'explanations/explanation.json.jbuilder', locals: { explanation: explanation })
    end
end
