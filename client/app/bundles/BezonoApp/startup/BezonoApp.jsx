import React from 'react';
import { render } from 'react-dom'
import ReactOnRails from 'react-on-rails';
import { Provider } from 'react-redux';
import createStore from '../store/BezonoAppStore';
import Bezono from '../containers/BezonoApp';

const BezonoApp = (props, _railsContext) => {
  const store = createStore(props);
  const reactComponent = (
    <Provider store={store}>
      <BezonoApp />
    </Provider>
  );
  return reactComponent;
};


ReactOnRails.register({ BezonoApp });
