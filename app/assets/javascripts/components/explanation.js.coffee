
@Explanation = React.createClass
  getInitialState: ->
    explanation: @props.explanation
    demand: @props.demand
    user_id: @props.explanation.user_id
    demand_id: @props.explanation.demand_id
    organization_profile_id: @props.explanation.organization_profile_id
    question_id: @props.explanation.question_id
    current_user: @props.current_user
  render: ->
    if @props.current_user != null
      React.DOM.div
        className: 'well rounded'
        key: @props.explanation.id
        React.DOM.p
          className: 'explanation-message'
          "Сообщение: "
          @props.explanation.message
        React.DOM.p null, @props.explanation.user_id
        React.DOM.p null, @props.explanation.demand_id
        React.DOM.p null, @props.explanation.organization_profile_id
        React.DOM.p null, @props.explanation.question_id
    else
      React.DOM.div
        className: 'well rounded'
        
