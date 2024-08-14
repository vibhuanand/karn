import React from 'react';
import { BrowserRouter as Router, Route, Routes, Link } from 'react-router-dom';
import Add from './components/Add';
import Estimate from './components/Estimate';
import Subtract from './components/Subtract';
// import Summary from './components/Summary';

function App() {
  return (
    <Router>
      <div>
        <nav>
          <ul>
            <li><Link to="/Add">Add</Link></li>
            <li><Link to="/Estimate">Estimate</Link></li>
            <li><Link to="/Subtract">Subtract</Link></li>
            {/* <li><Link to="/Summary">Summary</Link></li> */}
          </ul>
        </nav>
        <div className="content">
          <Routes>
            <Route path="/Add" element={<Add />} />
            <Route path="/Estimate" element={<Estimate />} />
            <Route path="/Subtract" element={<Subtract />} />
            {/* <Route path="/Summary" element={<Summary />} /> */}
            <Route path="/" element={<Add />} />
          </Routes>
        </div>
      </div>
    </Router>
  );
}

export default App;
