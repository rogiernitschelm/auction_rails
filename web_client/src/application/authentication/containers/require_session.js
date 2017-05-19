import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Redirect } from 'react-router-dom';
import { mapStateToProps } from '../';
import { getCurrentUser } from '../actions';

@connect(mapStateToProps, { getCurrentUser })
export default ComposedComponent => {
  class RequireSession extends Component {
    state = { redirect: false };

    componentWillMount() {
      this.props.getCurrentUser();

      if (!this.props.user) {
        this.setState({ redirect: true });
      }
    }

    componentWillUpdate(nextProps) {
      if (!nextProps.user) {
        this.setState({ redirect: true });
      }
    }

    componentWillUnmount() {
      this.setState({ redirect: false });
    }

    render() {
      if (this.state.redirect) {
        return <Redirect to="/" />;
      }

      return <ComposedComponent {...this.props} />;
    }
  }

  return RequireSession;
};
