// HelloWorldWidget is an arbitrary name for any "dumb" component. We do not recommend suffixing
// all your dump component names with Widget.

import React, { PropTypes } from 'react';
import Explanation from './Explanation';
import ExplanationForm from './ExplanationForm';

// Simple example of a React "dumb" component
export default class Explanations extends React.Component {
  static propTypes = {
    explanations: PropTypes.array.isRequired,
  };

  render() {
    const { explanations, current_user, demand, createExplanationPath } = this.props;

    const handleSubmit = (e) => {
      e.preventDefault();
    };

    const handleChange = (e) => {};

    const handleKeyUp = (e) => {
      if(e.keyCode == 13){
        if (typeof App !== 'undefined'){
          App.explanations.add(e.target.value);
        }else{
          explanationAdd({id: explanations.length + 1, content: e.target.value})
        }
        e.target.value = "";
      };
    };

    var request_form;

    if (current_user.supplier) {
      request_form = (
        <ExplanationForm
          key={"request_form_"+demand.id}
          demand={demand}
          current_user={current_user}
          createExplanationPath={createExplanationPath}
          question_id={null}
          button_message="Задать вопрос"/>
      );
    }


    return (
      <div className="explanations">
        <h3 className="title">Запросы разъяснений</h3>
        <div className="explanations-list">
          {
            explanations.map((exp) => {

                var answer;
                if (exp.question_id === null || typeof exp.question_id === 'undefined') {
                  answer = explanations.filter(function(obj) {
                    return obj.id === exp.answer_id;
                    })[0];

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
          {request_form}
        </div>
      </div>
    );
  }
}
