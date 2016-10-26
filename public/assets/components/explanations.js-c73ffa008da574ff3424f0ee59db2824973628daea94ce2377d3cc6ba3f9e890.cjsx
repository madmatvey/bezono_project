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
