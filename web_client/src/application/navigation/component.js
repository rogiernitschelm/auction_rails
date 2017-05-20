import React from 'react';
import { Nav, NavLeft, NavRight, NavItem } from 'common';
import NavigationContainer from './container';
import SellerLinks from './children/seller_links';
import BuyerLinks from './children/buyer_links';

const NavigationComponent = props => {
  const renderSessionButton = () => {
    if (props.authenticated) {
      return (
        <NavItem className="is-tab" onClick={() => props.logout()}>
          Uitloggen
        </NavItem>
      );
    }

    return (
      <NavItem className="is-tab" to="/login">
        Inloggen
      </NavItem>
    );
  };

  const renderAccountButton = () => {
    if (props.authenticated) {
      return (
        <NavItem className="is-tab" to='/account'>
          Account
        </NavItem>
      );
    }

    return (
      <NavItem className="is-tab" to="/registration">
        Registratie
      </NavItem>
    );
  };

  const renderUsertypeSepecificLinks = () => {
    if (props.usertype === 'seller') {
      return <SellerLinks />;
    }

    if (props.usertype === 'buyer') {
      return <BuyerLinks />;
    }

    return <div />;
  };

  return (
    <Nav className="has-shadow">
      <NavLeft>
        <NavItem className="is-tab">
          Reclameveiling
        </NavItem>
      </NavLeft>
      {renderUsertypeSepecificLinks()}
      <NavRight>
        {renderAccountButton()}
        {renderSessionButton()}
      </NavRight>
    </Nav>
  );
};

export default NavigationContainer(NavigationComponent);
