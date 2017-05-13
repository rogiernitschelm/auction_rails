import config from 'config';
import axios from 'axios';

export const actionTypes = Object.freeze({
  AUTHENTICATE: 'AUTHENTICATE',
  AUTHENTICATE_SUCCESS: 'AUTHENTICATE_SUCCESS',
  AUTHENTICATE_FAILURE: 'AUTHENTICATE_FAILURE',

  LOGOUT: 'LOGOUT'
});

export const login = credentials => {
  return async dispatch => {
    dispatch({ type: actionTypes.AUTHENTICATE });

    try {
      const loginResponse = await axios.post(`${config.authorizations}/login`, credentials);
      localStorage.setItem('auth_token', loginResponse.data.auth_token);

      dispatch({ type: actionTypes.AUTHENTICATE_SUCCESS, payload: loginResponse });
    } catch (error) {
      dispatch({ type: actionTypes.AUTHENTICATE_FAILURE, payload: error });
    }
  };
};

export const logout = () => {
  return dispatch => {
    localStorage.removeItem('auth_token');

    dispatch({ type: actionTypes.LOGOUT });
  };
};
