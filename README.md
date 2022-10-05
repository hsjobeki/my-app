# Demo: simple Create React App with Dream2nix

Installed as dependency:

`"@example/core": "github:hsjobeki/example-library-core"`

App.tsx:
```jsx
import React from "react";
import "./App.css";
import { sayHello } from "@example/core"; //Cannot find module '@example/core' or its corresponding type declarations. 

function App() {
  return (
    <div className="App">
      <button onClick={() => sayHello("Mike")}>Say it</button>
    </div>
  );
}

export default App;
```# will-not-be-built
