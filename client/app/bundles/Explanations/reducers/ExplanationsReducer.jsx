import Immutable from 'immutable';

import actionTypes from '../constants/explanationsConstants';

export const $$initialState = Immutable.fromJS({
  explanations: [], // this is the default state that would be used if one were not passed into the store
  demand: '',
});

export default function explanationsReducer($$state = $$initialState, action) {
  const { type, name } = action;

  switch (type) {
    case actionTypes.EXPLANATION_ADD:
      return $$state.set('message', message);

    default:
      return $$state;
  }
}
