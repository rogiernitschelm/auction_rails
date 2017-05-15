import React, { Component } from 'react';
import LoginContainer from './container';
import { Form, Input, Hero, Section } from 'common';

@LoginContainer
export default class LoginComponent extends Component {
  render() {
    const { handleSubmit, onSubmit, error } = this.props;

    return (
      <Hero className="is-fullheight is-primary is-bold">
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
      </Hero>
    );
  }
}
