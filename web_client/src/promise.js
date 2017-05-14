import axios from 'axios';
import config from 'config';

export default ({ dispatch }) => {
  return next => async action => {
    const { promise, types } = action;

    if (!promise) {
      return next(action);
    }

    const token = localStorage.getItem('auth_token') || {};
    const headers = { headers: { Authorization: token } };
    const [, SUCCESS, FAILURE] = types;
    const { path, method = 'get', params = {}, root = 'api' } = promise;

    let response;
    try {
      response = await axios[method](`${config[root]}/${path}`, params, headers);

      return dispatch({ payload: response, type: SUCCESS });
    } catch (error) {
      return dispatch({ type: FAILURE, error });
    }
  };
};
