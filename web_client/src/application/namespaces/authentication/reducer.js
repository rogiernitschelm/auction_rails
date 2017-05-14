import {
  AUTHENTICATE,
  AUTHENTICATE_SUCCESS,
  AUTHENTICATE_FAILURE,
  LOGOUT
} from './';

const INITIAL_STATE = {
  authenticated: false,
  loading: false,
  usertype: {},
  error: {}
};

export default (state = INITIAL_STATE, action) => {
  switch (action.type) {
    case AUTHENTICATE: {
      return {
        ...state,
        loading: true
      };
    }

    case AUTHENTICATE_SUCCESS: {
      return {
        ...state,
        authenticated: true,
        usertype: action.payload.data.usertype,
        loading: false
      };
    }

    case AUTHENTICATE_FAILURE: {
      return {
        ...state,
        error: action.error,
        loading: false
      };
    }

    case LOGOUT: {
      return {
        ...state,
        authenticated: false
      };
    }

    default:
      return state;
  }
};
