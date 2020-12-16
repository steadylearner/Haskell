// import Counter from "./components/Counter";

import { jsCounter as Counter } from "./components/Counter.purs";
import "./App.css";

const App = () => {
  return (
    <div className="App">
      <Counter label="Click me!" />
    </div>
  );
};

export default App;