export default state => ({
  authenticated: !!state.authentication.user,
  usertype: state.authentication.user ? state.authentication.user.usertype : null
});
