import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Redirect } from 'react-router-dom';
import { mapStateToProps } from '../';
import { getCurrentUser } from 'authentication';

@connect(mapStateToProps, { getCurrentUser })
export default ComposedComponent => {
  class RequireNoSession extends Component {
    state = { redirect: false };

    componentWillMount() {
      if (this.props.user) {
        this.setState({ redirect: true });
      }

      if (localStorage.getItem('authToken')) {
        this.props.getCurrentUser();
      }
    }

    componentWillUpdate(nextProps) {
      if (this.props.user) {
        this.setState({ redirect: true });
      }

      if (nextProps.user) {
        this.setState({ redirect: true });
      }
    }

    componentWillUnmount() {
      this.setState({ redirect: false });
    }

    render() {
      if (this.state.redirect) {
        switch (this.props.usertype) {
          case 'seller': return <Redirect to="/seller" />;
          case 'buyer': return <Redirect to="/buyer" />;
          default: return <Redirect to="/" />;
        }
      }

      return <ComposedComponent {...this.props} />;
    }
  }

  return RequireNoSession;
};
