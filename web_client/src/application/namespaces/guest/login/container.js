import React, { Component } from 'react';
import { reduxForm } from 'redux-form';
import { connect } from 'react-redux';
import { RequireNoSession, login } from 'authentication';
import { mapStateToProps } from './';

@connect(mapStateToProps, { login })
@reduxForm({ form: 'login', fields: ['email', 'password'] })
@RequireNoSession
export default ComposedComponent => {
  class LoginContainer extends Component {
    constructor(props) {
      super(props);

      this.onSubmit = ::this.onSubmit;
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
