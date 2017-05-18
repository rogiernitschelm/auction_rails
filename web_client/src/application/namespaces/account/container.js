import React, { Component } from 'react';
import { RequireSession } from 'authentication';

@RequireSession
export default ComposedComponent => {
  class AccountContainer extends Component {
    render() {
      return (
        <ComposedComponent
          {...this.props}
        />
      );
    }
  }

  return AccountContainer;
};
