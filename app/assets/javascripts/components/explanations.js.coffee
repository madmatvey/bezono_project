@Explanations = React.createClass(
  getInitialState: ->
    explanations: @props.explanations
    demand: @props.demand
  getDefaultProps: ->
    explanations: []
  addExplanation: (explanation) ->
    explanations = @state.explanations.slice()
    explanations.push explanation
    @setState explanations: explanations

  render: ->
    React.DOM.div
      className: 'explanations'
      React.DOM.h3
        className: 'title'
        'Запросы разъяснений'
      React.DOM.div
        className: 'explanations-list'
        React.DOM.div null,
          for explanation in @state.explanations
            React.createElement Explanation, key: explanation.id, explanation: explanation
      React.createElement ExplanationForm, handleNewExplanation: @addExplanation, demand: @props.demand, current_user: @props.current_user
      React.DOM.hr null

)
