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



  componentWillMount() {

    console.log("PROPS from Root component");
    console.log(this.props);

    console.log("componentWillMount");

    // store.dispatch(setExplanations(this.props.explanations));
    // store.dispatch(setCurrentUser(this.props.current_user));
    // store.dispatch(setDemand(this.props.demand));

    if (typeof App !== 'undefined'){
      App.explanations = App.cable.subscriptions.create("ExplanationsChannel", {
        connected: function() {
          console.log("connected");
          console.log(this);
        },
        disconnected: function() {console.log("disconnected");},
        received: function(data) {
          console.log("received");
          alert("received some DATA:"+data);
          // return store.dispatch(addExplanation(data['explanation']));
        },
        add: function(explanation) {
          console.log("add:");
          console.log(explanation);
          console.log(this);
          addExplanation(explanation);
          return this.perform('add', {
            explanation: explanation
          });
        }
      });
    }

  }

  render() {
    return (
      // <SocketProvider socket={socket}>
        <ChatApp />
      // </SocketProvider>
    );
  }
}




const RootApp = (props, _railsContext) => {
  const store = configureStore(props);
  console.log("PROPS from RootApp");
  console.log(props);
  console.log("STORE from RootApp");
  console.log(store);
  const reactComponent = (

    <Provider store={store}>
      <Root store={store}/>
    </Provider>
  );
  return reactComponent;
};

// This is how react_on_rails can see the HelloWorldApp in the browser.
ReactOnRails.register({ RootApp });
