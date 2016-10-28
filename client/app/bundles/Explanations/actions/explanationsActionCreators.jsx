import actionTypes from '../constants/explanationsConstants';

export function explanationAdd(message) {
  return {
    type: actionTypes.EXPLANATION_ADD,
    message,
  };
}
