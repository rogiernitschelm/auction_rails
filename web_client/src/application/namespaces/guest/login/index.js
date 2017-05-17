import React from 'react';
import { Hero } from 'common';
import LoginComponent from '../shared/login_form';

export default () =>
  <Hero className="is-fullheight is-primary is-bold">
    <LoginComponent />
  </Hero>;
