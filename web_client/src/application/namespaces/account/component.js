import React, { Component } from 'react';
import { Hero, Section, Form, Input, Tabs, Tab } from 'common';
import AccountContainer from './container';

@AccountContainer
export default class AccountComponent extends Component {
  render() {
    const { handleSubmit, onSubmit, updateAccountError } = this.props;

    return (
      <div>
        <Hero className="is-primary is-small is-bold" title="Jouw account" />

        <Tabs className="is-centered is-small">
          <Tab to="/">Gebruikersgegevens</Tab>
          <Tab to="/">Zakelijke gegevens</Tab>
          <Tab to="/">Account verwijderen</Tab>
        </Tabs>

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
