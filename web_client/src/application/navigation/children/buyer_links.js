import React from 'react';
import { NavCenter, NavItem } from 'common';

export default () => {
  return (
    <NavCenter>
      <NavItem className="is-tab" to="/buyer/auctions">
        Mijn biedingen
      </NavItem>
    </NavCenter>
  );
};
