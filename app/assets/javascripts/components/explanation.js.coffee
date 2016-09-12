
@Explanation = React.createClass
  getInitialState: ->
    explanation: @props.explanation
    user_id: @props.explanation.user_id
    question_id: @props.explanation.question_id
    current_user: @props.current_user
    demand: @props.demand
    answer: @props.answer
    createExplanationPath: @props.createExplanationPath

  # addAnswer: (explanation) ->
  #   @setState explanation: explanation
  #   # console.log explanations

  render: ->
    React.DOM.div
      className: 'well rounded'
      "Сообщение №#{@props.explanation.id}: "
      @props.explanation.message

      React.DOM.div
        className: 'p text-right'
        "User ID: "
        @props.explanation.user_id


      if typeof @props.answer == 'undefined' && @props.current_user.active_profile_id == @props.demand.organization_profile_id
        React.createElement ExplanationForm, handleNewExplanation: @props.handleNewExplanation, button_message: "Ответить на (№#{@props.explanation.id})", key: "answer_form_#{@props.explanation.id}", question_id: @props.explanation.id, demand: @props.demand, current_user: @props.current_user, createExplanationPath: @props.createExplanationPath
      if typeof @props.answer != 'undefined' #!= null
        # console.log @props.answer
        React.DOM.div
          className: 'rounded bg-success'
          key: "answer_#{@props.answer.id}"
          "Ответ №#{@props.answer.id}: "
          @props.answer.message
          React.DOM.div
            className: 'p text-right'
            "User ID: "
            @props.answer.user_id

      # React.DOM.p null, @props.explanation.demand_id
      # React.DOM.p null, @props.explanation.organization_profile_id
      # React.DOM.p null, @props.explanation.question_id
