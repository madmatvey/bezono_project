import React, { Component } from 'react';
import { render } from 'react-dom'
import { Provider } from 'react-redux';
import ChatApp from './ChatApp';
import configureStore from '../store/configureStore';
import {setExplanations, addExplanation} from '../actions/chat'
import ReactOnRails from 'react-on-rails';



// reactComponent = RootApp(props, railsContext);

const store = configureStore();

export default class Root extends Component {

  componentWillMount() {

    // console.log("componentWillMount");

    store.dispatch(setExplanations(this.props.explanations));

    if (typeof App !== 'undefined'){
      App.explanations = App.cable.subscriptions.create("ExplanationsChannel", {
        connected: function() {},
        disconnected: function() {},
        received: function(data) {
          return store.dispatch(addExplanation(data['explanation']));
        },
        add: function(explanation) {
          return this.perform('add', {
            explanation: explanation
          });
        }
      });
    }

  }
  render() {
    return (
      <Provider store={store}>
        <ChatApp />
      </Provider>
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


ReactOnRails.register({ Root });
