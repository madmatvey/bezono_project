// HelloWorldWidget is an arbitrary name for any "dumb" component. We do not recommend suffixing
// all your dump component names with Widget.

import React, { PropTypes } from 'react';

// Simple example of a React "dumb" component
export default class Explanations extends React.Component {
  static propTypes = {
    // If you have lots of data or action properties, you should consider grouping them by
    // passing two properties: "data" and "actions".
    explanations: PropTypes.array.isRequired,
  };

  render() {
    const { explanations, current_user } = this.props;
    // console.log(explanations);
    return (
      <div className="explanations">
        <h3 className="title">Запросы разъяснений</h3>
        <div className="explanations-list">
          {
            explanations.map((exp) => {

                var answer;
                // console.log(exp);
                if (exp.question_id === null || typeof exp.question_id === 'undefined') {
                  answer = explanations.filter(function(obj) {
                    return obj.id === exp.answer_id;
                    })[0];
                    // return <Explanation explanation={exp}/>
                  return <Explanation key={"explanation_" + exp.id}
                                      explanation= { exp }
                                      current_user= { this.props.current_user }
                                      demand = { this.props.demand }
                                      answer = { answer }>
                                      </Explanation>
                    // createExplanationPath: this.props.createExplanationPath,
                    // handleNewExplanation: this.addExplanation
                }
            })
          }
        </div>
      </div>
    );
  }
}


class Explanation extends React.Component {
  static propTypes = {
    // If you have lots of data or action properties, you should consider grouping them by
    // passing two properties: "data" and "actions".
    // explanation: PropTypes.array.isRequired,
    explanation: PropTypes.shape({
      id: PropTypes.number.isRequired,
      user_id: PropTypes.number.isRequired,
      message: PropTypes.string.isRequired
    })
  };

  // _renderAnswer: function(){
  //   return {
  //     if (typeof answer === 'undefined' && current_user.active_profile_id === demand.organization_profile_id) {
        // React.createElement(ExplanationForm, {
        //   handleNewExplanation: this.props.handleNewExplanation,
        //   button_message: "Ответить на (№" + explanation.id + ")",
        //   key: "answer_form_" + explanation.id,
        //   question_id: explanation.id,
        //   demand: demand,
        //   current_user: current_user,
        //   createExplanationPath: createExplanationPath
        // });
  //     }
  //   }
  //
  // },

  render() {
    const { explanation, class_name, current_user, demand, answer } = this.props;
    // console.log(explanations);

    var elem;

    if (typeof answer !== 'undefined') {
      // console.log(answer);
      elem = (
        <div className="rounded bg-success" key={"answer_" + answer.id} >
          Ответ №{answer.id}: {answer.message}
          <div className="p text-right">
            User ID: {answer.user_id}
          </div>
        </div>
      );
    }
    else if (current_user.active_profile_id === demand.organization_profile_id) {
      elem = (<div>ФОРМА</div>);
      // React.createElement(ExplanationForm, {
      //   handleNewExplanation: this.props.handleNewExplanation,
      //   button_message: "Ответить на (№" + explanation.id + ")",
      //   key: "answer_form_" + explanation.id,
      //   question_id: explanation.id,
      //   demand: demand,
      //   current_user: current_user,
      //   createExplanationPath: createExplanationPath
      // });
    }

    return (
      <div className="well rounded" key={"explanation_" + explanation.id}>
        Сообщение №{ explanation.id }: { explanation.message }
        <div className="p text-right">User ID:{explanation.user_id}</div>
        {elem}
        </div>
    );

  }
}

      //     ), typeof answer === 'undefined' && current_user.active_profile_id === demand.organization_profile_id ? React.createElement(ExplanationForm, {
      //   handleNewExplanation: this.props.handleNewExplanation,
      //   button_message: "Ответить на (№" + explanation.id + ")",
      //   key: "answer_form_" + explanation.id,
      //   question_id: explanation.id,
      //   demand: demand,
      //   current_user: current_user,
      //   createExplanationPath: createExplanationPath
      // }) : void 0, typeof answer !== 'undefined' ? React.DOM.div({
      //   className: 'rounded bg-success',
      //   key: "answer_" + answer.id
      // }, "Ответ №" + answer.id + ": ", answer.message, React.DOM.div({
      //   className: 'p text-right'
      // }, "User ID: ", answer.user_id)) : void 0
