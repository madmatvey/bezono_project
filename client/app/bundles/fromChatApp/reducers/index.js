import { combineReducers } from 'redux';
import explanations from './chat';
import current_user from './user';
import demand from './demand';

const rootReducer = combineReducers({
  explanations,
  current_user,
  demand
});

export default rootReducer;
