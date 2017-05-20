import {
  AUTHENTICATE,
  AUTHENTICATE_SUCCESS,
  AUTHENTICATE_FAILURE,

  REGISTRATION_SUCCESS,
  REGISTRATION_FAILURE,

  GET_CURRENT_USER,
  GET_CURRENT_USER_SUCCESS,
  GET_CURRENT_USER_FAILURE,

  LOGOUT,
  UNMOUNT
} from './';

const INITIAL_STATE = {
  loading: false,
  error: '',
  user: null
};

export default (state = INITIAL_STATE, action) => {
  switch (action.type) {
    case GET_CURRENT_USER: {
      return {
        ...state,
        loading: true
      };
    }

    case GET_CURRENT_USER_SUCCESS: {
      const { user, usertype } = action.payload.data;

      return {
        ...state,
        loading: false,
        user: { ...user, usertype },
      };
    }

    case GET_CURRENT_USER_FAILURE: {
      return {
        ...state,
        loading: false,
        error: action.error.message
      };
    }

    case AUTHENTICATE: {
      return {
        ...state,
        loading: true,
      };
    }

    case AUTHENTICATE_SUCCESS: {
      const { user, usertype } = action.payload.data;

      return {
        ...state,
        user: { ...user, usertype },
        loading: false,
        error: null
      };
    }

    case AUTHENTICATE_FAILURE: {
      return {
        ...state,
        error: action.error.message,
        loading: false
      };
    }

    case REGISTRATION_SUCCESS: {
      return {
        ...state,
        user: action.payload.data.user,
        error: null,
        loading: false
      };
    }

    case REGISTRATION_FAILURE: {
      return {
        ...state,
        error: action.error.message,
        loading: false
      };
    }

    case LOGOUT: {
      return {
        ...state,
        user: null
      };
    }

    case UNMOUNT: {
      return {
        ...state,
        error: ''
      };
    }

    default:
      return state;
  }
};
