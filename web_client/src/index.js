import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import { createStore, applyMiddleware } from 'redux';
import createHistory from 'history/createBrowserHistory';
import { ConnectedRouter } from 'react-router-redux';
import { Route, Switch } from 'react-router-dom';

import reducer from './reducer';
import Application from './application/application';
import NotFound from './application/namespaces/other/not_found';
import { LoginComponent } from './application/namespaces/guest/login';
import './style/index.scss';
import Welcome from './application/namespaces/guest/welcome';

import middleware from './middleware';
import Navigation from './application/navigation';
import Footer from './application/footer';

const history = createHistory();
const store = applyMiddleware(middleware)(createStore);

ReactDOM.render(
  <Provider store={store(reducer)}>
    <ConnectedRouter history={history}>
      <Application>
        <Navigation />
        <Switch>
          <Route exact path="/" component={Welcome} />
          <Route exact path="/registration" />
          <Route exact path="/login" component={LoginComponent} />

          <Route path="/seller" />
          <Route path="/buyer" />
          <Route path="/admin" />

          <Route component={NotFound} />
        </Switch>
        <Footer />
      </Application>
    </ConnectedRouter>
  </Provider>,
  document.querySelector('#root')
);
