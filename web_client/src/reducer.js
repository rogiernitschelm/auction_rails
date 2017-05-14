import { combineReducers } from 'redux';
import { routerReducer as routing } from 'react-router-redux';
import { authenticationReducer as authentication } from 'authentication';
import { reducer as form } from 'redux-form';

export default combineReducers({
  routing,
  authentication,
  form
});
