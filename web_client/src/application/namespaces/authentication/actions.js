import config from 'config';
import axios from 'axios';
import { actionTypes } from 'helpers';

export const types = actionTypes({
  AUTHENTICATE: 'AUTHENTICATE',
  AUTHENTICATE_SUCCESS: 'AUTHENTICATE_SUCCESS',
  AUTHENTICATE_FAILURE: 'AUTHENTICATE_FAILURE',

  LOGOUT: 'LOGOUT'
});

export const login = credentials => {
  return async dispatch => {
    dispatch({ type: types.AUTHENTICATE });

    try {
      const loginResponse = await axios.post(`${config.authorizations}/login`, credentials);
      localStorage.setItem('auth_token', loginResponse.data.auth_token);

      dispatch({ type: types.AUTHENTICATE_SUCCESS, payload: loginResponse });
    } catch (error) {
      dispatch({ type: types.AUTHENTICATE_FAILURE, payload: error });
    }
  };
};

export const logout = () => {
  return dispatch => {
    localStorage.removeItem('auth_token');

    dispatch({ type: types.LOGOUT });
  };
};
