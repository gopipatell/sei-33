import React from 'react';

// HashRouter is strongly preferred to save headaches with deployment.
import { HashRouter as Router, Route } from 'react-router-dom';

import Home from './components/Home';
import FAQ from './components/FAQ';
import Character from './components/Character';

// Not a functional component. It's just a collection of JSX.
const Routes = (
  <Router>
    <div>
      <Route exact path="/" component={ Home } />
      <Route exact path="/faq" component={ FAQ } />
      <Route path="/characters/:name" component={ Character } />
    </div>
  </Router>
);

export default Routes;
