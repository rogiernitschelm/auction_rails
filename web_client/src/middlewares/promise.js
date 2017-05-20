import axios from 'axios';
import config from 'config';
import snakeCaseKeys from 'snakecase-keys';
import camelCaseKeys from 'camelcase-keys';

export default ({ dispatch }) => {
  return next => async action => {
    const { promise, types } = action;

    if (!promise) {
      return next(action);
    }

    const token = localStorage.getItem('authToken') || null;
    const [REQUEST, SUCCESS, FAILURE] = types;

    const { path, method = 'get', params = {}, root = 'api' } = promise;
    let response;

    try {
      dispatch({ type: REQUEST });
      
      response = await axios.request({
        url: `${config[root]}/${path}`,
        method,
        data: snakeCaseKeys(params),
        headers: { authorization: token }
      });

      return dispatch({ payload: camelCaseKeys(response, { deep: true }), type: SUCCESS });
    } catch (error) {
      return dispatch({ type: FAILURE, error });
    }
  };
};
