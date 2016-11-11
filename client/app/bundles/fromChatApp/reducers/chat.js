import { SET_EXPLANATIONS, ADD_EXPLANATION } from '../actions/chat';

export default function explanations(state = {}, action) {
  const { type, explanations } = action;

  switch (type) {
  case ADD_EXPLANATION:
    // console.log("зашли в редьюсер ADD_EXPLANATION");
    return [
      ...state,
      action.explanation
    ]
  case SET_EXPLANATIONS:
    return explanations
  default:
    return state;
  }
}
