export const AUTHENTICATE = 'AUTHENTICATE';
export const AUTHENTICATE_SUCCESS = 'AUTHENTICATE_SUCCESS';
export const AUTHENTICATE_FAILURE = 'AUTHENTICATE_FAILURE';

export const LOGOUT = 'LOGOUT';

export const login = credentials => {
  return {
    types: [AUTHENTICATE, AUTHENTICATE_SUCCESS, AUTHENTICATE_FAILURE],
    promise: {
      method: 'post',
      path: '/login',
      root: 'authorizations',
      params: credentials
    }
  };
};

export const logout = () => {
  localStorage.removeItem('auth_token');

  return {
    type: LOGOUT
  };
};
