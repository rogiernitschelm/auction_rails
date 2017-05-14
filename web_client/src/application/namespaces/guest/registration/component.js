import React, { Component } from 'react';
import { RegistrationContainer } from './';
import { Form, Input, HeroFullHeight } from 'common';

@RegistrationContainer
export default class LoginComponent extends Component {
  render() {
    const { handleSubmit, onSubmit, error, options } = this.props;

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
            label="Voornaam"
            name="firstName"
            placeholder="Jouw voornaam"
            type="text"
          />

          <Input
            label="tussenvoegsel"
            name="infix"
            placeholder="bijvoorbeeld 'van' of 'de'"
            type="text"
          />

          <Input
            label="Achternaam"
            name="lastName"
            placeholder="Jouw achternaam"
            type="text"
          />

          <Input
            label="Soort gebruiker"
            name="usertype"
            type="select"
            options={options}
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
