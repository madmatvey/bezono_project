import React, { PropTypes } from 'react';
import ExplanationForm from './ExplanationForm';

export default class Explanation extends React.Component {
  static propTypes = {
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
      elem = (
        <ExplanationForm
          button_message={ "Ответить на (№" + explanation.id + ")" }
          key={ "answer_form_" + explanation.id }
          question_id={explanation.id}
          demand={demand}
          current_user={current_user}/>);
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
