import React, { Component } from 'react';
import { Hero } from 'common';
import AccountContainer from './container';

@AccountContainer
export default class AccountComponent extends Component {
  render() {
    return (
      <Hero>
        component
      </Hero>
    );
  }
}
