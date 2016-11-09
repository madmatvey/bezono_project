import React, { Component, PropTypes } from 'react';
import Explanation from './Explanation';
import ExplanationForm from './ExplanationForm';

class Chat extends Component {

  render() {
    console.log("PROPS at Chat");
    console.log(this.props);

    const { explanations, addExplanation, current_user, demand } = this.props;

    // const handleSubmit = (e) => {
    //   e.preventDefault();
    // };
    //
    // const handleKeyUp = (e) => {
    //   if(e.keyCode == 13){
    //     if (typeof App !== 'undefined'){
    //       App.explanations.add(e.target.value);
    //     }else{
    //       addExplanation({id: explanations.length + 1, content: e.target.value})
    //     }
    //     e.target.value = "";
    //   };
    // };

    var request_form;

    if (current_user.supplier) {
      request_form = (
        <ExplanationForm
          key={"request_form_"+demand.id}
          demand={demand}
          current_user={current_user}
          addExplanation={addExplanation}
          question_id={undefined}
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
                                      answer = { answer }
                                      explanations = {explanations}>
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

  //   return (
  //     // <div className="well rounded" key={"explanation_" + explanation.id}>
  //     //   Сообщение №{ explanation.id }: { explanation.message }
  //     //   <div className="p text-right">User ID:{explanation.user_id}</div>
  //     //   {elem}
  //     //   </div>
  //
  //
  //
  //
  //     <div>
  //       <ul>
  //         {explanations.map((msg) => {
  //             return <li key={`chat.msg.${msg.id}`}>{msg.message}</li>;
  //           })
  //         }
  //       </ul>
  //       <form onSubmit={handleSubmit}>
  //         <input type="text" onKeyUp={handleKeyUp}/>
  //       </form>
  //     </div>
  //   );
  // }
}

Chat.propTypes = {
  explanations: PropTypes.any
};

export default Chat;
