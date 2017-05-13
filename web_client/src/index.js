import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import { createStore, applyMiddleware } from 'redux';
import reduxThunk from 'redux-thunk';
import createHistory from 'history/createBrowserHistory';
import { ConnectedRouter } from 'react-router-redux';
import { Route, Switch } from 'react-router-dom';

import reducer from './reducer';
import Application from './application';
import NotFound from './application/namespaces/other/not_found';
import './style/index.scss';

const history = createHistory();
const store = applyMiddleware(reduxThunk)(createStore);

ReactDOM.render(
  <Provider store={store(reducer)}>
    <ConnectedRouter history={history}>
      <Application>
        <Switch>
          <Route exact path="/registration" />
          <Route exact path="/login" />

          <Route path="/seller" />
          <Route path="/buyer" />
          <Route path="/admin" />

          <Route component={NotFound} />
        </Switch>
      </Application>
    </ConnectedRouter>
  </Provider>,
  document.querySelector('#root')
);
