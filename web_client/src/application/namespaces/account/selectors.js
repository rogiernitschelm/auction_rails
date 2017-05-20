export const mapStateToProps = (state) => {
  return {
    user: state.authentication.user,
    usertype: state.authentication.usertype,
    initialValues: state.authentication.user
  };
};
