(function() {
  this.Explanation = React.createClass({displayName: "Explanation",
    propTypes: {
      explanation: React.PropTypes.shape({
        id: React.PropTypes.number.isRequired,
        user_id: React.PropTypes.number.isRequired,
        message: React.PropTypes.string.isRequired
      })
    },
    getInitialState: function() {
      return {
        question_id: this.props.explanation.question_id,
        answer: this.props.answer
      };
    },
    render: function() {
      var answer, createExplanationPath, current_user, demand, explanation, question_id, user_id;
      explanation = this.props.explanation;
      user_id = this.props.explanation.user_id;
      question_id = this.props.explanation.question_id;
      current_user = this.props.current_user;
      demand = this.props.demand;
      answer = this.props.answer;
      createExplanationPath = this.props.createExplanationPath;
      return React.DOM.div({
        className: 'well rounded',
        ref: "explanation_" + explanation.id
      }, "Сообщение №" + explanation.id + ": ", explanation.message, React.DOM.div({
        className: 'p text-right'
      }, "User ID: ", explanation.user_id), typeof answer === 'undefined' && current_user.active_profile_id === demand.organization_profile_id ? React.createElement(ExplanationForm, {
        handleNewExplanation: this.props.handleNewExplanation,
        button_message: "Ответить на (№" + explanation.id + ")",
        key: "answer_form_" + explanation.id,
        question_id: explanation.id,
        demand: demand,
        current_user: current_user,
        createExplanationPath: createExplanationPath
      }) : void 0, typeof answer !== 'undefined' ? React.DOM.div({
        className: 'rounded bg-success',
        key: "answer_" + answer.id
      }, "Ответ №" + answer.id + ": ", answer.message, React.DOM.div({
        className: 'p text-right'
      }, "User ID: ", answer.user_id)) : void 0);
    }
  });

}).call(this);
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
(function() {
  this.Explanations = React.createClass({displayName: "Explanations",
    propTypes: {
      explanations: React.PropTypes.array,
      createExplanationPath: React.PropTypes.string,
      demand: React.PropTypes.object,
      current_user: React.PropTypes.object
    },
    getInitialState: function() {
      return {
        explanations: this.props.explanations,
        demand: this.props.demand,
        current_user: this.props.current_user,
        createExplanationPath: this.props.createExplanationPath
      };
    },
    getDefaultProps: function() {
      return {
        explanations: []
      };
    },
    addExplanation: function(explanation) {
      var explanations, question;
      if (explanation.question_id !== null) {
        question = this.state.explanations.filter(function(obj) {
          return obj.id === explanation.question_id;
        })[0];
        question.answer_id = explanation.id;
      }
      explanations = this.state.explanations.slice();
      explanations.push(explanation);
      return this.setState({
        explanations: explanations
      });
    },
    render: function() {
      var answer, explanation;
      return React.DOM.div({
        className: 'explanations'
      }, React.DOM.h3({
        className: 'title'
      }, 'Запросы разъяснений'), React.DOM.div({
        className: 'explanations-list'
      }, (function() {
        var i, len, ref, results;
        ref = this.state.explanations;
        results = [];
        for (i = 0, len = ref.length; i < len; i++) {
          explanation = ref[i];
          if (explanation.question_id === null || typeof explanation.question_id === 'undefined') {
            answer = this.state.explanations.filter(function(obj) {
              return obj.id === explanation.answer_id;
            })[0];
            results.push(React.createElement(Explanation, {
              key: "explanation_" + explanation.id,
              explanation: explanation,
              current_user: this.props.current_user,
              demand: this.props.demand,
              answer: answer,
              createExplanationPath: this.props.createExplanationPath,
              handleNewExplanation: this.addExplanation
            }));
          } else {
            results.push(void 0);
          }
        }
        return results;
      }).call(this)), this.props.current_user.supplier ? React.createElement(ExplanationForm, {
        handleNewExplanation: this.addExplanation,
        button_message: "Задать вопрос",
        key: "request_form_" + this.props.demand.id,
        demand: this.props.demand,
        current_user: this.props.current_user,
        createExplanationPath: this.props.createExplanationPath
      }) : void 0);
    }
  });

}).call(this);
