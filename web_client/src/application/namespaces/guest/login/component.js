import React, { Component } from 'react';
import { Container, Row, Col } from 'react-grid-system';
import LoginContainer from './container';

@LoginContainer
export default class LoginComponent extends Component {
  render() {
    return (
      <Container>
        <Row>
          <Col xs={12}>
            LOGIN
          </Col>
        </Row>
      </Container>
    );
  }
}
