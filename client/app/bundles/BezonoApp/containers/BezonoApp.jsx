import React, { PropTypes } from 'react';
import BezonoAppWidget from '../components/BezonoAppWidget';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';
import Immutable from 'immutable';
import * as BezonoAppCreators from '../actions/BezonoAppActionCreators';

function select(state) {

  return { $$BezonoAppStore: state.$$BezonoAppStore };
}

const Bezono = (props) => {
  const { dispatch, $$BezonoAppStore } = props;
  const actions = bindActionCreators(BezonoAppCreators, dispatch);
  // const { updateName } = actions;
  const name = $$BezonoAppStore.get('name');

  return (
    <BezonoAppWidget />
  );
};

Bezono.propTypes = {
  dispatch: PropTypes.func.isRequired,


  $$BezonoAppStore: PropTypes.instanceOf(Immutable.Map).isRequired,
};

export default connect(select)(Bezono);
