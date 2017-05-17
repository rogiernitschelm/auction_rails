import React, { Component } from 'react';
import { reduxForm } from 'redux-form';
import { connect } from 'react-redux';
import { RequireNoSession, login, unmount } from 'authentication';
import mapStateToProps from './selectors';

@connect(mapStateToProps, { login, unmount })
@reduxForm({ form: 'login', fields: ['email', 'password'] })
@RequireNoSession
export default ComposedComponent => {
  class LoginContainer extends Component {
    constructor(props) {
      super(props);

      this.onSubmit = ::this.onSubmit;
    }

    componentWillUnmount() {
      this.props.unmount();
    }

    onSubmit({ email, password }) {
      if (email && password) {
        this.props.login({ email, password });
      }
    }

    render() {
      return (
        <ComposedComponent
          {...this.props}
          onSubmit={this.onSubmit}
        />
      );
    }
  }

  return LoginContainer;
};
