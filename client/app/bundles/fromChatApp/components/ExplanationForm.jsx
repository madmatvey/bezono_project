import React, { PropTypes } from 'react';
export default class ExplanationForm extends React.Component {
  static propTypes = {
    // message: PropTypes.string,
    // demand_id: PropTypes.object.isRequired, //this.props.demand.id,
    // user_id: PropTypes.integer.isRequired,
    // organization_profile_id: PropTypes.integer.isRequired,
    // createExplanationPath: PropTypes.string.isRequired,
    // question_id: PropTypes.integer.isRequired,
    // button_message: PropTypes.string.isRequired
  };

  constructor(props) {
    super(props)
    this.state = {message: ''}
  };

  valid() {
    return this.state.message; this.props.demand.id && this.props.current_user.id && this.props.current_user.active_profile_id;
  };


  handleChange = (e) => {
    this.setState({message: e.target.value})
  };

  handleSubmit = (e) => {
    const { current_user, demand, question_id, explanations, addExplanation } = this.props;
    e.preventDefault();
    console.log("Добавляем сообщение: " + this.state.message);
    console.log(this.props);

    if (typeof App !== 'undefined'){
      console.log("вызываю App.explanations.add ")
      App.explanations.add(
          {
            message: this.state.message,
            user_id: current_user.id,
            demand_id: demand.id,
            organization_profile_id: current_user.active_profile_id
          });
    }else{
      addExplanation({id: explanations.length + 1, message: this.state.message,user_id: current_user.id});
    }
    e.target.value = "";
  };
  // handleSubmit = (e) => {
  //   console.log("Добавляем сообщение: "+ e.target.value)
  //   // dispatch(explanationAdd({message: e.target.value}))
  // }


  render() {
    const { dispatch, current_user, demand, question_id, button_message, explanations, addExplanation } = this.props;

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

    return (
      <form className="form-inline" onSubmit={this.handleSubmit}>
        <div className="form-group">
          <input
            className="form-control"
            placeholder="Сообщение"
            name="message"
            type="text"
            // onKeyUp={handleKeyUp}
            value={this.message}
            onChange={this.handleChange}/>
          <input
            type="hidden"
            name="demand_id"
            value={demand.id}/>
          <input
            type="hidden"
            name="user_id"
            value={current_user.id}/>
          <input
            type="hidden"
            name="organization_profile_id"
            value={current_user.active_profile_id}/>
          <input
            type="hidden"
            name="question_id"
            value={question_id}/>
          <button type="submit"
            disabled={!this.valid()}
            className="btn btn-primary">
            {button_message}</button>
        </div>

      </form>
    );
  };

};
