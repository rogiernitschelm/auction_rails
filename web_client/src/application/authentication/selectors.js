export const mapStateToProps = state => {
  return {
    loading: state.authentication.loading,
    authenticated: state.authentication.authenticated
  };
};
