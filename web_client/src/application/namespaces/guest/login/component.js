import React, { Component } from 'react';
import { Container, Row, Col } from 'react-grid-system';
import LoginContainer from './container';
import { RequireNoSession } from 'authentication';

@RequireNoSession
@LoginContainer
export default class LoginComponent extends Component {
  onLogin() {
    this.props.login({ email: 'mail@hoogle.nom', password: 'abcd1234' });
  }

  render() {
    return (
      <Container>
        <Row>
          <Col xs={12}>
            <button onClick={() => this.onLogin()}>clickerdeclick</button>
            LOGIN
          </Col>
        </Row>
      </Container>
    );
  }
}
