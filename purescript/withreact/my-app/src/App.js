// import Counter from "./components/Counter"; // 1. 
// import { jsCounter as Counter } from "./components/Counter.purs"; // 2.
import { jsCounter as Counter } from "./components/Counter/Interlop.purs"; // 3.
import "./App.css";

const App = () => {
  return (
    <div className="App">
      <Counter 
        // label="Click me!" 
      />
    </div>
  );
};

export default App;