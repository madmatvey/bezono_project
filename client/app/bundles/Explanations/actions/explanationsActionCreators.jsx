import actionTypes from '../constants/explanationsConstants';

export function explanationAdd(explanation) {
  return {
    type: actionTypes.EXPLANATION_ADD,
    explanation,
  };
}


export function setExplanations(explanations) {
  return {
    type: SET_EXPLANATIONS,
    explanations: explanations
  };
}
