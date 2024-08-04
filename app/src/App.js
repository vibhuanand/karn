import React from 'react';
import { BrowserRouter as Router, Route, Switch, Link } from 'react-router-dom';
import Add from './components/Add';
import Estimate from './components/Estimate';
import Subtract from './components/Subtract';
import Summary from './components/Summary';

function App() {
  return (
    <Router>
      <div>
        <nav>
          <ul>
            <li><Link to="/add">Add</Link></li>
            <li><Link to="/estimate">Estimate</Link></li>
            <li><Link to="/subtract">Subtract</Link></li>
            <li><Link to="/summary">Summary</Link></li>
          </ul>
        </nav>
        <div className="content">
          <Switch>
            <Route path="/add" component={Add} />
            <Route path="/estimate" component={Estimate} />
            <Route path="/subtract" component={Subtract} />
            <Route path="/summary" component={Summary} />
            <Route path="/" exact component={Add} />
          </Switch>
        </div>
      </div>
    </Router>
  );
}

export default App;
