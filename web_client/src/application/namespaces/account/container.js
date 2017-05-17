import React, { Component } from 'react';

export default ComposedComponent => {
  class AccountContainer extends Component {
    render() {
      return (
        <ComposedComponent

        />
      );
    }
  }

  return AccountContainer;
};
