import { compose, createStore, applyMiddleware, combineReducers } from 'redux';

// See
// https://github.com/gaearon/redux-thunk and http://redux.js.org/docs/advanced/AsyncActions.html
// This is not actually used for this simple example, but you'd probably want to use this
// once your app has asynchronous actions.
import thunkMiddleware from 'redux-thunk';

import reducers from '../reducers';
import { initialStates } from '../reducers';

export default props => {
  // This is how we get initial props Rails into redux.
  const { explanations } = props;
  const { $$explanationsState } = initialStates;

  // Redux expects to initialize the store using an Object, not an Immutable.Map
  const initialState = {
    $$explanationsStore: $$explanationsState.merge({
      explanations,
    }),
  };

  const reducer = combineReducers(reducers);
  const composedStore = compose(
    applyMiddleware(thunkMiddleware)
  );
  const storeCreator = composedStore(createStore);
  const store = storeCreator(reducer, initialState);

  return store;
};
