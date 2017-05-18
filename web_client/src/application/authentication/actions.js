export const AUTHENTICATE = 'AUTHENTICATE';
export const AUTHENTICATE_SUCCESS = 'AUTHENTICATE_SUCCESS';
export const AUTHENTICATE_FAILURE = 'AUTHENTICATE_FAILURE';

export const REGISTRATION = 'REGISTRATION';
export const REGISTRATION_SUCCESS = 'REGISTRATION_SUCCESS';
export const REGISTRATION_FAILURE = 'REGISTRATION_FAILURE';

export const GET_CURRENT_USER = 'GET_CURRENT_USER';
export const GET_CURRENT_USER_SUCCESS = 'GET_CURRENT_USER_SUCCESS';
export const GET_CURRENT_USER_FAILURE = 'GET_CURRENT_USER_FAILURE';

export const LOGOUT = 'LOGOUT';
export const UNMOUNT = 'UNMOUNT';

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

export const unmount = () => ({ type: UNMOUNT });

export const registration = userInformation => {
  return {
    types: [REGISTRATION, REGISTRATION_SUCCESS, REGISTRATION_FAILURE],
    promise: {
      method: 'post',
      path: `${userInformation.usertype}s`,
      root: 'api',
      params: userInformation
    }
  };
};

export const getCurrentUser = () => {
  return {
    types: [GET_CURRENT_USER, GET_CURRENT_USER_SUCCESS, GET_CURRENT_USER_FAILURE],
    promise: {
      method: 'get',
      path: 'get_current_user',
      root: 'authorizations'
    }
  };
};
