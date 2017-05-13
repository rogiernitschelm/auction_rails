import React, { Component } from 'react';

export default ComposedComponent => {
  class LoginContainer extends Component {
    render() {
      return (
        <ComposedComponent />
      );
    }
  }

  return LoginContainer;
};
