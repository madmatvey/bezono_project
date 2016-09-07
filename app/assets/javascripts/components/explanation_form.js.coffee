@ExplanationForm = React.createClass
  getInitialState: ->
    message: ''
    demand_id: @props.demand.id
    user_id: @props.current_user.id
    organization_profile_id: @props.current_user.active_profile_id
  valid: ->
    @state.message && @state.demand_id && @state.user_id && @state.organization_profile_id

  handleSubmit: (e) ->
    e.preventDefault()
    console.log "PROPS ON POST AJAX: " + @props.demand.id
    $.post "/demands/#{@props.demand.id}/explanations", { explanation: @state }, (data) =>
      @props.handleNewExplanation data
      @setState @getInitialState()
    , 'JSON'

  render: ->
    console.log "PROPS ON RENDER FORM: " + @props.demand.id
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Сообщение'
          name: 'message'
          value: @state.message
          onChange: @handleChange

          # :message, :user_id, :demand_id, :organization_profile_id, :question_id, :criterion_ids => []
        React.DOM.input
          type: 'hidden'
          name: 'demand_id'
          value: @props.demand.id
        React.DOM.input
          type: 'hidden'
          name: 'user_id'
          value: @props.current_user.id
        React.DOM.input
          type: 'hidden'
          name: 'organization_profile_id'
          value: @props.current_user.active_profile_id
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        'Create Explanation'

  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
