import React, { Component } from 'react';
import { reduxForm } from 'redux-form';
import { connect } from 'react-redux';
import { RequireNoSession, registration } from 'authentication';
import { mapStateToProps } from './';

const fields = [
  'email',
  'password',
  'firstName',
  'lastName',
  'usertype'
];

const options = [
  { text: 'Bieder', value: 'buyer' },
  { text: 'Aanbieder', value: 'seller' }
];

@connect(mapStateToProps, { registration })
@reduxForm({ form: 'registration', fields })
@RequireNoSession
export default ComposedComponent => {
  class RegistrationContainer extends Component {
    constructor(props) {
      super(props);

      this.onSubmit = ::this.onSubmit;
    }

    onSubmit(userInformation) {
      this.props.registration(userInformation);
    }

    render() {
      return (
        <ComposedComponent
          {...this.props}
          onSubmit={this.onSubmit}
          options={options}
        />
      );
    }
  }

  return RegistrationContainer;
};
