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
  authenticated: localStorage.getItem('auth_token') ? true : false,
  loading: false,
  usertype: {},
  error: '',
  user: {}
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
      console.log(action.payload.date)
      return {
        ...state,
        loading: false,
        user: action.payload.data
      };
    }

    case AUTHENTICATE: {
      return {
        ...state,
        loading: true,
      };
    }

    case AUTHENTICATE_SUCCESS: {
      return {
        ...state,
        authenticated: true,
        usertype: action.payload.data.usertype,
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
        error: null,
        loading: false,
        authenticated: true
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
        authenticated: false
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
