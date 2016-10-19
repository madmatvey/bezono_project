
@Explanations = React.createClass(
  propTypes:
    explanations: React.PropTypes.array,
    createExplanationPath: React.PropTypes.string,
    demand: React.PropTypes.object,
    current_user: React.PropTypes.object
  getInitialState: ->
    explanations: @props.explanations
    # return {explanations: explanations}
    # explanations: @props.explanations
    demand: @props.demand
    current_user: @props.current_user
    createExplanationPath: @props.createExplanationPath
  getDefaultProps: ->
    explanations: []
  addExplanation: (explanation) ->
    if explanation.question_id != null
      question = @state.explanations.filter((obj) ->
        obj.id == explanation.question_id
        )[0]
      question.answer_id = explanation.id
    explanations = @state.explanations.slice()
    explanations.push explanation
    @setState explanations: explanations

  #
  # setupSubscription: ->
  #   App.explanations = App.cable.subscriptions.create "ExplanationsChannel", explantion_id: @state.explantion.id
  #     connected: ->
  #       setTimeout(() => this.perform('follow', {explnation_id: this.explanation.id}), 1000 )
  #
  #     received: (data) ->
  #       this.addExplanation(data.explanation)
  #
  # componentDidMount: ->
  #   this.setupSubscription

  render: ->
    React.DOM.div
      className: 'explanations'
      React.DOM.h3
        className: 'title'
        'Запросы разъяснений'
      React.DOM.div
        className: 'explanations-list'
        for explanation in @state.explanations
          if explanation.question_id == null || typeof explanation.question_id == 'undefined'
            answer = @state.explanations.filter((obj) ->
              obj.id == explanation.answer_id
              )[0]
            React.createElement Explanation, key: "explanation_#{explanation.id}", explanation: explanation, current_user: @props.current_user, demand: @props.demand, answer: answer, createExplanationPath: @props.createExplanationPath, handleNewExplanation: @addExplanation

          # else
            # @setState "explanation_#{explanation.question_id}":explanation


      if @props.current_user.supplier
        React.createElement ExplanationForm, handleNewExplanation: @addExplanation, button_message: "Задать вопрос", key: "request_form_#{@props.demand.id}", demand: @props.demand, current_user: @props.current_user, createExplanationPath: @props.createExplanationPath
)
