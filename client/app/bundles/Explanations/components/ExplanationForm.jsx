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
  }

  valid() {
    return this.state.message; this.props.demand.id && this.props.current_user.id && this.props.current_user.active_profile_id;
  };

  handleChange = (e) => {
    this.setState({message: e.target.value})
  }

  handleSubmit = (e) => {
    dispatch(explanationAdd({message: e.target.value}))


    // if(e.keyCode == 13){
    //   if (typeof App !== 'undefined'){
    //     console.log("ADD EXPL: " + e.target.value);
    //     App.explanations.add(e.target.value);
    //   }else{
    //     console.log("ELSE EXPL: " + e.target.value);
    //     addExplanation({id: explanations.length + 1, content: e.target.value})
    //   }
    //   e.target.value = "";
    // };
  };

  render() {
    const { dispatch, current_user, demand, question_id, button_message, createExplanationPath } = this.props;

    // const handleSubmit = (e) => {
    //   e.preventDefault();
    //   return $.post(createExplanationPath, {
    //     explanation: this.state
    //   }, (function(_this) {
    //     return function(data) {
    //       _this.props.handleNewExplanation(data);
    //       return _this.setState(_this.getInitialState());
    //     };
    //   })(this), 'JSON');
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
