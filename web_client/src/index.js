import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import { createStore, applyMiddleware } from 'redux';
import createHistory from 'history/createBrowserHistory';
import { ConnectedRouter } from 'react-router-redux';
import { Route, Switch } from 'react-router-dom';

import promise from './middlewares/promise';
import jwtStorage from './middlewares/jwt_storage';
import reducer from './reducer';

import Application from './application/application';
import Navigation from './application/navigation';
import Footer from './application/footer';
import NotFound from './application/namespaces/other/not_found';
import Login from './application/namespaces/guest/login';
import Registration from './application/namespaces/guest/registration';
import Welcome from './application/namespaces/guest/welcome';
import Account from './application/namespaces/account';
import './style/index.scss';

const history = createHistory();
const store = applyMiddleware(promise, jwtStorage)(createStore);

ReactDOM.render(
  <Provider store={store(reducer)}>
    <ConnectedRouter history={history}>
      <Application>
        <Navigation />
          <main>
            <Switch>
              <Route exact path="/" component={Welcome} />
              <Route exact path="/registration" component={Registration} />
              <Route exact path="/login" component={Login} />

              <Route path="/seller" />
              <Route path="/buyer" />
              <Route path="/admin" />

              <Route path="/account" component={Account} />

              <Route component={NotFound} />
            </Switch>
          </main>
        <Footer />
      </Application>
    </ConnectedRouter>
  </Provider>,
  document.querySelector('#root')
);
