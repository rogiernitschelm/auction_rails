export const mapStateToProps = (state) => {
  return {
    user: state.authentication.user,
    initialValues: state.authentication.user,
    updateAccountError: state.account.error
  };
};
