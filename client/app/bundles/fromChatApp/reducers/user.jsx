import { SET_CURRENT_USER } from '../actions/chat';

export default function current_user(state = {}, action) {
  const { type, current_user } = action;

  switch (type) {
  case SET_CURRENT_USER:
    return current_user
  default:
    return state;
  }
}
