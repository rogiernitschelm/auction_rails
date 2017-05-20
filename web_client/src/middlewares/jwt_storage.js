import { AUTHENTICATE_SUCCESS, REGISTRATION_SUCCESS } from 'authentication';

export default () => {
  return next => async action => {
    if ([AUTHENTICATE_SUCCESS, REGISTRATION_SUCCESS].includes(action.type)) {
      localStorage.setItem('authToken', action.payload.data.authToken);
    }

    return next(action);
  };
};
