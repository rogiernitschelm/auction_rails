export const mapStateToProps = state => {
  return {
    loading: state.authentication.loading,
    user: state.authentication.user
  };
};
