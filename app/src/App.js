import React from 'react';
import { BrowserRouter as Router, Route, Switch, Link } from 'react-router-dom';
import Add from './components/Add';
import Estimate from './components/Estimate';
import Subtract from './components/Subtract';
import Summary from './components/summary';

function App() {
  return (
    <Router>
      <div>
        <nav>
          <ul>
            <li><Link to="/Add">Add</Link></li>
            <li><Link to="/Estimate">Estimate</Link></li>
            <li><Link to="/Subtract">Subtract</Link></li>
            <li><Link to="/Summary">Summary</Link></li>
          </ul>
        </nav>
        <div className="content">
          <Switch>
            <Route path="/Add" component={Add} />
            <Route path="/Estimate" component={Estimate} />
            <Route path="/Subtract" component={Subtract} />
            <Route path="/Summary" component={Summary} />
            <Route path="/" exact component={Add} />
          </Switch>
        </div>
      </div>
    </Router>
  );
}

export default App;
