// HelloWorldWidget is an arbitrary name for any "dumb" component. We do not recommend suffixing
// all your dump component names with Widget.

import React, { PropTypes } from 'react';

// Simple example of a React "dumb" component
export default class BezonoAppWidget extends React.Component {
  static propTypes = {
    // If you have lots of data or action properties, you should consider grouping them by
    // passing two properties: "data" and "actions".
    // updateName: PropTypes.func.isRequired,
    createExplanationPath: PropTypes.string.isRequired,
  };

  // // React will automatically provide us with the event `e`
  // handleChange(e) {
  //   const name = e.target.value;
  //   this.props.updateName(createExplanationPath);
  // }

  render() {
    const { createExplanationPath } = this.props;
    return (
      <div className="container">
        <h3>
          Hello, {createExplanationPath}!
        </h3>
      </div>
    );
  }
}
