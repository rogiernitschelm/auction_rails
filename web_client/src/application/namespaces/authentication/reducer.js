import { types } from './';

const {
  AUTHENTICATE_SUCCESS,
  AUTHENTICATE_FAILURE,
  LOGOUT
} = types;

const INITIAL_STATE = {
  authenticated: false,
  usertype: {},
  error: {}
};

export default (state = INITIAL_STATE, action) => {
  switch (action.type) {
    case AUTHENTICATE_SUCCESS: {
      return {
        ...state,
        authenticated: true,
        usertype: action.payload.data.usertype
      };
    }

    case AUTHENTICATE_FAILURE: {
      return {
        ...state,
        error: action.payload.data.error
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
