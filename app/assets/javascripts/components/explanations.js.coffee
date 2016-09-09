@Explanations = React.createClass(
  getInitialState: ->
    explanations: @props.explanations
    demand: @props.demand
    current_user: @props.current_user
    createExplanationPath: @props.createExplanationPath
  getDefaultProps: ->
    explanations: []
  addExplanation: (explanation) ->
    console.log "WHEN ADD: "
    console.log explanation
    explanations = @state.explanations.slice()

    if explanation.question_id != null
      question = explanations.filter((obj) ->
          obj.id == explanation.question_id
        )[0]
      question.answer_id = explanation.id
      console.log "QUESION IS"
      console.log question
    explanations.push explanation
    @setState explanations: explanations
    console.log explanations

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
