import Immutable from 'immutable';

import actionTypes from '../constants/explanationsConstants';

export const $$initialState = Immutable.fromJS({
  explanations: [], // this is the default state that would be used if one were not passed into the store
  demand: 0,

});

export default function explanationsReducer($$state = $$initialState, action) {
  const { type, explanations } = action;

  switch (type) {
    case actionTypes.EXPLANATION_ADD:
      return $$state.set('explanation', explanation);
    case actionTypes.SET_EXPLANATIONS:
      return {
        ...$$state,
        explanations: action.payload
      };

    default:
      return $$state;
  }
}
