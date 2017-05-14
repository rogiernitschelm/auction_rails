import axios from 'axios';
import config from 'config';
import { AUTHENTICATE, REGISTRATION } from 'authentication';
import snakeCaseKeys from 'snakecase-keys';

export default ({ dispatch }) => {
  return next => async action => {
    const { promise, types } = action;

    if (!promise) {
      return next(action);
    }

    const token = localStorage.getItem('auth_token') || null;
    const renderHeaders = [AUTHENTICATE, REGISTRATION].includes(action.type);
    const headers = renderHeaders ? { headers: { Authorization: token } } : null;

    const [, SUCCESS, FAILURE] = types;
    const { path, method = 'get', params = {}, root = 'api' } = promise;
    let response;

    try {
      response = await axios[method](
        `${config[root]}/${path}`,
        { ...snakeCaseKeys(params) },
        { headers }
      );

      return dispatch({ payload: response, type: SUCCESS });
    } catch (error) {
      return dispatch({ type: FAILURE, error });
    }
  };
};
