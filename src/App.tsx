import React from "react";
import "./App.css";
import { sayHello } from "@example/core";

function App() {
  return (
    <div className="App">
      <button onClick={() => sayHello("Mike")}>Say it</button>
    </div>
  );
}

export default App;
