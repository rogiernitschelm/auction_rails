import { UPDATE_ACCOUNT_FAILURE } from './actions';

const INITIAL_STATE = {
  error: null
};

export default (state = INITIAL_STATE, action) => {
  switch (action.type) {
    case UPDATE_ACCOUNT_FAILURE: {
      return {
        ...state,
        error: action.error.message
      };
    }

    default: {
      return { ...state };
    }
  }
};
