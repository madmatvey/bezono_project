import React, { PropTypes } from 'react';
import ExplanationsWidget from '../components/ExplanationsWidget';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';
import Immutable from 'immutable';
import * as explanationsActionCreators from '../actions/explanationsActionCreators';

function select(state) {
  // Which part of the Redux global state does our component want to receive as props?
  // Note the use of `$$` to prefix the property name because the value is of type Immutable.js
  return { $$explanationsStore: state.$$explanationsStore };
}

// Simple example of a React "smart" component
const Explanations = (props) => {
  const { dispatch, $$explanationsStore } = props;
  const actions = bindActionCreators(explanationsActionCreators, dispatch);
  // const { updateName } = actions;
  const explanations = $$explanationsStore.get('explanations');

  // This uses the ES2015 spread operator to pass properties as it is more DRY
  // This is equivalent to:
  // <HelloWorldWidget $$helloWorldStore={$$helloWorldStore} actions={actions} />
  return (
    <Explanations {...{ updateName, name }} />
  );
};

Explanations.propTypes = {
  dispatch: PropTypes.func.isRequired,

  // This corresponds to the value used in function select above.
  // We prefix all property and variable names pointing to Immutable.js objects with '$$'.
  // This allows us to immediately know we don't call $$helloWorldStore['someProperty'], but
  // instead use the Immutable.js `get` API for Immutable.Map
  $$explanationsStore: PropTypes.instanceOf(Immutable.Map).isRequired,
};

// Don't forget to actually use connect!
// Note that we don't export HelloWorld, but the redux "connected" version of it.
// See https://github.com/reactjs/react-redux/blob/master/docs/api.md#examples
export default connect(select)(Explanations);
