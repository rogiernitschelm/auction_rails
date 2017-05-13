import React, { Component } from 'react';
import { connect } from 'react-redux';
import { mapStateToProps, login } from './';

@connect(mapStateToProps, { login })
export default ComposedComponent => {
  class RequireNoSession extends Component {
    state = { redirect: false };

    componentWillUnmount() {
      this.setState({ redirect: false });
    }

    render() {
      return <ComposedComponent {...this.props} />;
    }
  }

  return RequireNoSession;
};
