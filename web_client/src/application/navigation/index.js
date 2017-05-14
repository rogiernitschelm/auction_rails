import React, { Component } from 'react';
import { Nav, NavLeft, NavRight, NavItem } from 'common';
import { connect } from 'react-redux';
import { logout } from '../authentication';

@connect(null, { logout })
export default class Navigation extends Component {
  render() {
    return (
      <Nav className="has-shadow">
        <NavLeft>
          <NavItem className="is-tab">
            Reclameveiling
          </NavItem>
        </NavLeft>
        <NavRight>
          <NavItem className="is-tab">
            Account
          </NavItem>
          <NavItem className="is-tab" onClick={() => this.props.logout()}>
            Uitloggen
          </NavItem>
        </NavRight>
      </Nav>
    );
  }
}
