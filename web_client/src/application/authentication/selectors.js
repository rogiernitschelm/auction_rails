export const mapStateToProps = state => {
  return {
    authenticated: state.authentication.authenticated,
    usertype: state.authentication.usertype
  };
};