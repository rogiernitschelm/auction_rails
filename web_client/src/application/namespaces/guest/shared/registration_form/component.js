import React, { Component } from 'react';
import RegistrationContainer from './container';
import { Form, Input } from 'common';

@RegistrationContainer
export default class LoginComponent extends Component {
  render() {
    const { handleSubmit, onSubmit, registrationError, options } = this.props;

    return (
      <Form
        title="Gebruikersregistratie"
        onSubmit={handleSubmit(onSubmit)}
        error={registrationError}
      >
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
    );
  }
}
