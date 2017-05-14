import React, { Component } from 'react';
import LoginContainer from './container';
import { Form, Input, HeroFullHeight } from 'common';

@LoginContainer
export default class LoginComponent extends Component {
  constructor(props) {
    super(props);

    this.onSubmit = ::this.onSubmit;
  }

  onLogin() {
    this.props.login({ email: 'mail@hoogle.nom', password: 'abcd1234' });
  }

  onSubmit({ email, password }) {
    if (email && password) {
      this.props.login({ email, password });
    }
  }

  render() {
    const { handleSubmit, onSubmit, error } = this.props;

    return (
      <HeroFullHeight>
        <Form title="Log in" onSubmit={handleSubmit(onSubmit)} error={error}>
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
      </HeroFullHeight>
    );
  }
}
