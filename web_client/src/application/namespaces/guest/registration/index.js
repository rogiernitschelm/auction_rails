import React from 'react';
import { Hero } from 'common';
import RegistrationComponent from '../shared/registration_form';

export default () =>
  <Hero className="is-fullheight is-primary is-bold">
    <RegistrationComponent />
  </Hero>;
