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
