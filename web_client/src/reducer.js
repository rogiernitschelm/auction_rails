import { combineReducers } from 'redux';
import { routerReducer as routing } from 'react-router-redux';
import { authenticationReducer as authentication } from 'authentication';

export default combineReducers({
  routing,
  authentication
});
