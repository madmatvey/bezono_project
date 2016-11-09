import React, { Component } from 'react';
import { render } from 'react-dom'
import { Provider } from 'react-redux';
import ChatApp from './ChatApp';
import configureStore from '../store/configureStore';
import {setExplanations, addExplanation, setCurrentUser, setDemand} from '../actions/chat'
import ReactOnRails from 'react-on-rails';


// const store = configureStore();

export default class Root extends Component {

  constructor(props) {
    super(props)
    this.state = {
      explanations: this.props.explanations,
      current_user: this.props.current_user,
      demand: this.props.demand,
      // dispatch: this.props.dispatch
      // createExplanationPath: this.props.createExplanationPath
    }
  };

  // componentWillMount() {
  //
  //   // console.log("componentWillMount");
  //
  //   store.dispatch(setExplanations(this.props.explanations));
  //   store.dispatch(setCurrentUser(this.props.current_user));
  //   store.dispatch(setDemand(this.props.demand));
  //
  //   if (typeof App !== 'undefined'){
  //     App.explanations = App.cable.subscriptions.create("ExplanationsChannel", {
  //       connected: function() {},
  //       disconnected: function() {},
  //       received: function(data) {
  //         return store.dispatch(addExplanation(data['explanation']));
  //       },
  //       add: function(explanation) {
  //         return this.perform('add', {
  //           explanation: explanation
  //         });
  //       }
  //     });
  //   }
  //
  // }
  render() {
    return (
      // <Provider store={store}>
        <ChatApp />
      // </Provider>
    );
  }
}




const RootApp = (props, _railsContext) => {
  const store = configureStore(props);

  const reactComponent = (
    <Provider store={store}>
      <Root />
    </Provider>
  );
  return reactComponent;
};

// This is how react_on_rails can see the HelloWorldApp in the browser.
ReactOnRails.register({ RootApp });
