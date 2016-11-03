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

    render() {
      var message = '';

      const { user_id, demand_id, organization_profile_id, question_id, button_message, createExplanationPath } = this.props;

      const valid = () => {
        return message && demand_id && user_id && organization_profile_id;
      };


      const handleSubmit = (e) => {
        e.preventDefault();
        return $.post(this.props.createExplanationPath, {
          explanation: this.state
        }, (function(_this) {
          return function(data) {
            _this.props.handleNewExplanation(data);
            return _this.setState(_this.getInitialState());
          };
        })(this), 'JSON');
      };

      const handleChange = (e) => {
        var name, obj;
        name = e.target.name;
        return this.setState((
          obj = {},
          obj["" + name] = e.target.value,
          obj
        ));
      };

      return (
        <form className="form-inline" onSubmit={handleSubmit}>
          <div className="form-group">
            <input
              className="form-control"
              placeholder="Сообщение"
              name="message"
              type="text"
              // onKeyUp={handleKeyUp}
              value={messaage}
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
