import React, { Component } from 'react';
import { connect } from 'react-redux';
import { logout, getCurrentUser } from 'authentication';
import { mapStateToProps } from './';

@connect(mapStateToProps, { logout, getCurrentUser })
export default ComposedComponent => {
  class Navigation extends Component {
    componentWillMount() {
      this.props.getCurrentUser();
    }

    render() {
      console.warn(this.props)
      return (
        <ComposedComponent
          {...this.props}
        />
      );
    }
  }

  return Navigation;
};
