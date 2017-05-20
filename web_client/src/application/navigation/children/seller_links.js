import React from 'react';
import { NavCenter, NavItem } from 'common';

export default () => {
  return (
    <NavCenter>
      <NavItem className="is-tab" to="/seller/auctions">
        Mijn veilingen
      </NavItem>
      <NavItem className="is-tab" to="/seller/create_auction">
        Veiling plaatsen
      </NavItem>
    </NavCenter>
  );
};
