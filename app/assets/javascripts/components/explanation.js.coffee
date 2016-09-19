
@Explanation = React.createClass
  propTypes:
    explanation: React.PropTypes.shape(
      id: React.PropTypes.number.isRequired,
      user_id: React.PropTypes.number.isRequired,
      message: React.PropTypes.string.isRequired
    )
  getInitialState: ->
    question_id: @props.explanation.question_id
    answer: @props.answer

  # addAnswer: (explanation) ->
  #   @setState explanation: explanation
  #   # console.log explanations

  render: ->
    explanation = @props.explanation
    user_id = @props.explanation.user_id
    question_id = @props.explanation.question_id
    current_user = @props.current_user
    demand = @props.demand
    answer = @props.answer
    createExplanationPath = @props.createExplanationPath

    React.DOM.div
      className: 'well rounded'
      ref: "explanation_#{explanation.id}"
      "Сообщение №#{explanation.id}: "
      explanation.message

      React.DOM.div
        className: 'p text-right'
        "User ID: "
        explanation.user_id


      if typeof answer == 'undefined' && current_user.active_profile_id == demand.organization_profile_id
        React.createElement ExplanationForm, handleNewExplanation: @props.handleNewExplanation, button_message: "Ответить на (№#{explanation.id})", key: "answer_form_#{explanation.id}", question_id: explanation.id, demand: demand, current_user: current_user, createExplanationPath: createExplanationPath
      if typeof answer != 'undefined' #!= null
        # console.log @props.answer
        React.DOM.div
          className: 'rounded bg-success'
          key: "answer_#{answer.id}"
          "Ответ №#{answer.id}: "
          answer.message
          React.DOM.div
            className: 'p text-right'
            "User ID: "
            answer.user_id

      # React.DOM.p null, @props.explanation.demand_id
      # React.DOM.p null, @props.explanation.organization_profile_id
      # React.DOM.p null, @props.explanation.question_id
