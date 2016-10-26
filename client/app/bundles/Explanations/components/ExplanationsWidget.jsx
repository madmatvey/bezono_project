// HelloWorldWidget is an arbitrary name for any "dumb" component. We do not recommend suffixing
// all your dump component names with Widget.

import React, { PropTypes } from 'react';

// Simple example of a React "dumb" component
export default class Explanations extends React.Component {
  static propTypes = {
    // If you have lots of data or action properties, you should consider grouping them by
    // passing two properties: "data" and "actions".
    explanations: PropTypes.array.isRequired,
  };

  render() {
    const { explanations } = this.props;
    return (
      <div className="explanations">
        <h3 className="title">Запросы разъяснений</h3>
        <div className="explanations-list">
          {explanations.map((exp) => {
              return <div className="well rounded" key={`explanation_${exp.id}`}>{exp.message}</div>;
            })
          }
        </div>
      </div>
    );
  }
}
