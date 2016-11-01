import { compose, createStore, applyMiddleware, combineReducers } from 'redux';
import thunkMiddleware from 'redux-thunk';
import rootReducer from '../reducers';
import { initialStates } from '../reducers';

export default props => {
  // This is how we get initial props Rails into redux.
  const { name } = props;
  const { $$BezonoAppState } = initialStates;

  // Redux expects to initialize the store using an Object, not an Immutable.Map
  const initialState = {
    $$BezonoAppStore: $$BezonoAppState.merge({
      name,
    }),
  };

  const rootReducer = combineReducers(reducers);
  const composedStore = compose(
    applyMiddleware(thunkMiddleware)
  );
  const storeCreator = composedStore(createStore);
  const store = storeCreator(reducer, initialState);

  return store;
};
