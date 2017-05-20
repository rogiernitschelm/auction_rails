import pick from 'lodash/pick';

export const mapStateToProps = (state) => {
  return {
    ...pick(state.authentication.user, 'usertype'),
    initialValues:
      pick(state.authentication.user, ['email', 'city', 'birthDate', 'gender'])
  };
};
