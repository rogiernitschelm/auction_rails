import React, { Component } from 'react';
import { Nav, NavLeft, NavRight, NavItem } from 'common';
import { connect } from 'react-redux';
import { logout } from 'authentication';
import { mapStateToProps } from './';

@connect(mapStateToProps, { logout })
export default class Navigation extends Component {
  renderSessionButton() {
    if (this.props.authenticated) {
      return (
        <NavItem className="is-tab" onClick={() => this.props.logout()}>
          Uitloggen
        </NavItem>
      );
    }

    return (
      <NavItem className="is-tab" to="/login">
        Inloggen
      </NavItem>
    );
  }

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
          {this.renderSessionButton()}
        </NavRight>
      </Nav>
    );
  }
}
