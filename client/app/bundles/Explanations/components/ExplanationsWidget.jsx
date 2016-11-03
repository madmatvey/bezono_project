// HelloWorldWidget is an arbitrary name for any "dumb" component. We do not recommend suffixing
// all your dump component names with Widget.

import React, { PropTypes } from 'react';

// Simple example of a React "dumb" component
export default class Explanations extends React.Component {
  static propTypes = {
    explanations: PropTypes.array.isRequired,
  };

  render() {
    const { explanations, current_user, demand } = this.props;

    const handleSubmit = (e) => {
      e.preventDefault();
    };

    const handleChange = (e) => {};

    const handleKeyUp = (e) => {
      if(e.keyCode == 13){
        if (typeof App !== 'undefined'){
          App.explanations.add(e.target.value);
        }else{
          addMessage({id: explanations.length + 1, content: e.target.value})
        }
        e.target.value = "";
      };
    };

    var form;

    if (current_user.supplier) {
      form = (
        <form className="form-inline" onSubmit={handleSubmit}>
          <div className="form-group">
            <input
              className='form-control'
              placeholder='Сообщение'
              name='message'
              type="text"
              onKeyUp={handleKeyUp}
              // value={me
              onChange={handleChange}/>
            <input
              type="hidden"
              name="udemand_id"
              value={demand.id}/>
            <input
              type="hidden"
              name="user_id"
              value={current_user.id}/>
            <input
              type="hidden"
              name="organization_profile_id"
              value={current_user.active_profile_id}/>
            {/* <input
              type="hidden"
              name="question_id"
              value={question_id}/> */}
            <button type="submit"     // disabled={!this.valid()}
              className="btn btn-primary">

              Добавить сообщение</button>
          </div>

        </form>
      );

      // React.createElement(ExplanationForm, {
      //   handleNewExplanation: this.addExplanation,
      //   button_message: "Задать вопрос",
      //   key: "request_form_" + this.props.demand.id,
      //   demand: this.props.demand,
      //   current_user: this.props.current_user,
      //   createExplanationPath: this.props.createExplanationPath
      // });
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
          {form}
        </div>
      </div>
    );
  }
}


class Explanation extends React.Component {
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
