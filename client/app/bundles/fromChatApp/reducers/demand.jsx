import { SET_DEMAND } from '../actions/chat';

export default function demand(state = {}, action) {
  const { type, demand } = action;

  switch (type) {
  case SET_DEMAND:
    return demand
  default:
    return state;
  }
}
