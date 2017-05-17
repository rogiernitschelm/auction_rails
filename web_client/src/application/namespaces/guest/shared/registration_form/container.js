import React, { Component } from 'react';
import { reduxForm } from 'redux-form';
import { connect } from 'react-redux';
import { RequireNoSession, registration, unmount } from 'authentication';
import { userFormValidator as validate} from 'helpers';
import mapStateToProps from './selectors';

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

@connect(mapStateToProps, { registration, unmount })
@reduxForm({ form: 'registration', fields, validate })
@RequireNoSession
export default ComposedComponent => {
  class RegistrationContainer extends Component {
    constructor(props) {
      super(props);

      this.onSubmit = ::this.onSubmit;
    }

    componentWillUnmount() {
      this.props.unmount();
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
