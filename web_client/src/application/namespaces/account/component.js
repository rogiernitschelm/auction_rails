import React, { Component } from 'react';
import { Hero, Section, Form, Input } from 'common';
import AccountContainer from './container';

@AccountContainer
export default class AccountComponent extends Component {
  render() {
    const { handleSubmit, onSubmit, updateAccountError } = this.props;

    console.log(updateAccountError)
    return (
      <div>
        <Hero className="is-primary is-small is-bold" title="Jouw account" />
        <Section>
          <Form
            title="Wijzig jouw account"
            onSubmit={handleSubmit(onSubmit)}
            error={updateAccountError}
          >
            <Input
              autoFocus
              label="E-mail"
              name="email"
              placeholder="Jouw e-mail adres"
              type="email"
            />

            <Input
              label="Stad"
              name="city"
              placeholder="Jouw woonplaats"
              type="text"
            />

            <Input
              label="Geboortedatum"
              name="birthDate"
              placeholder="Jouw geboortedatum"
              type="date"
            />

            <Input
              label="Geslacht"
              name="gender"
              placeholder="Geslacht"
              type="select"
              options={this.props.options}
            />
          </Form>
        </Section>
      </div>
    );
  }
}
