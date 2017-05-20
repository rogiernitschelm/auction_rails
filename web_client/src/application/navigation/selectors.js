export default state => {
  return {
    authenticated: state.authentication.authenticated,
    usertype: state.authentication.usertype
  };
};
