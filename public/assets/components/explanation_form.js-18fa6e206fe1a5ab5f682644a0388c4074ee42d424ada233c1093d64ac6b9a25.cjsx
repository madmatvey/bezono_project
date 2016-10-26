(function() {
  this.ExplanationForm = React.createClass({displayName: "ExplanationForm",
    getInitialState: function() {
      return {
        message: '',
        demand_id: this.props.demand.id,
        user_id: this.props.current_user.id,
        organization_profile_id: this.props.current_user.active_profile_id,
        createExplanationPath: this.props.createExplanationPath,
        question_id: this.props.question_id,
        button_message: this.props.button_message
      };
    },
    valid: function() {
      return this.state.message && this.state.demand_id && this.state.user_id && this.state.organization_profile_id;
    },
    handleSubmit: function(e) {
      e.preventDefault();
      return $.post(this.props.createExplanationPath, {
        explanation: this.state
      }, (function(_this) {
        return function(data) {
          _this.props.handleNewExplanation(data);
          return _this.setState(_this.getInitialState());
        };
      })(this), 'JSON');
    },
    render: function() {
      return React.DOM.form({
        className: 'form-inline',
        onSubmit: this.handleSubmit
      }, React.DOM.div({
        className: 'form-group'
      }, React.DOM.input({
        type: 'text',
        className: 'form-control',
        placeholder: 'Сообщение',
        name: 'message',
        value: this.state.message,
        onChange: this.handleChange
      }), React.DOM.input({
        type: 'hidden',
        name: 'demand_id',
        value: this.props.demand.id
      }), React.DOM.input({
        type: 'hidden',
        name: 'user_id',
        value: this.props.current_user.id
      }), React.DOM.input({
        type: 'hidden',
        name: 'organization_profile_id',
        value: this.props.current_user.active_profile_id
      }), React.DOM.input({
        type: 'hidden',
        name: 'question_id',
        value: this.props.question_id
      })), React.DOM.button({
        type: 'submit',
        className: 'btn btn-primary',
        disabled: !this.valid()
      }, this.props.button_message));
    },
    handleChange: function(e) {
      var name, obj;
      name = e.target.name;
      return this.setState((
        obj = {},
        obj["" + name] = e.target.value,
        obj
      ));
    }
  });

}).call(this);
