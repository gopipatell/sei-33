import React from 'react';
import HelloWorld from './HelloWorld';
import HelloUser from './HelloUser';

function App() {
  return (
    <div className="App">
      <HelloWorld />
      <HelloUser name="Groucho" />
      <HelloUser name="Harpo" />
      <HelloUser />
      <img src="http://www.fillmurray.com/40/50" />
    </div>
  );
}

export default App;
