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

  renderAccountButton() {
    if (this.props.authenticated) {
      return (
        <NavItem className="is-tab" to={`${this.props.usertype}/account`}>
          Account
        </NavItem>
      );
    }

    return (
      <NavItem className="is-tab" to="/registration">
        Registratie
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
          {this.renderAccountButton()}
          {this.renderSessionButton()}
        </NavRight>
      </Nav>
    );
  }
}
