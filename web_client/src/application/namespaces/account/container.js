import React, { Component } from 'react';
import { RequireSession } from 'authentication';
import { reduxForm } from 'redux-form';
import { connect } from 'react-redux';
import { mapStateToProps } from './selectors';
import { updateAccount } from './actions';

const options = [
  { text: 'Man', value: 'male' },
  { text: 'Vrouw', value: 'female' }
];

@connect(mapStateToProps, { updateAccount })
@reduxForm({
  form: 'Account',
  fields: ['email', 'city', 'birthDate', 'gender']
})
@RequireSession
export default ComposedComponent => {
  class AccountContainer extends Component {
    onSubmit = ::this.onSubmit;

    onSubmit(formInformation) {
      console.warn(this.props)
      const userInformation = { ...formInformation, id: this.props.user.id };
      this.props.updateAccount(userInformation);
    }

    render() {
      return (
        <ComposedComponent
          {...this.props}
          options={options}
          onSubmit={this.onSubmit}
        />
      );
    }
  }

  return AccountContainer;
};
