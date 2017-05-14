export const AUTHENTICATE = 'AUTHENTICATE';
export const AUTHENTICATE_SUCCESS = 'AUTHENTICATE_SUCCESS';
export const AUTHENTICATE_FAILURE = 'AUTHENTICATE_FAILURE';

export const LOGOUT = 'LOGOUT';

export const login = ({ email, password }) => {
  return {
    types: [AUTHENTICATE, AUTHENTICATE_SUCCESS, AUTHENTICATE_FAILURE],
    promise: {
      method: 'post',
      path: 'login',
      root: 'authorizations',
      params: { email, password }
    }
  };
};

export const logout = () => {
  localStorage.removeItem('auth_token');

  return {
    type: LOGOUT
  };
};
