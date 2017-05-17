import React, { Component } from 'react';
import LoginContainer from './container';
import { Form, Input } from 'common';

@LoginContainer
export default class LoginComponent extends Component {
  render() {
    const { handleSubmit, onSubmit, loginError } = this.props;

    return (
      <Form title="Log in" onSubmit={handleSubmit(onSubmit)} error={loginError}>
        <Input
          autoFocus
          label="E-mail"
          name="email"
          placeholder="Jouw e-mail adres"
          type="email"
        />
        <Input
          label="Wachtwoord"
          name="password"
          placeholder="Jouw wachtwoord"
          type="password"
        />
      </Form>
    );
  }
}
