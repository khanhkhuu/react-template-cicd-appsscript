import { useState } from 'react'
import reactLogo from './assets/react.svg'
import './App.css'

function App() {
  const [count, setCount] = useState(0);
  const [countDouble, setCountDouble] = useState(0);

  function handleCountDoubleButtonClick() {
    setCountDouble((preValue) => preValue === 0 ? 1 : preValue * 2);
  }

  return (
    <>
      <div>
        <a href="https://react.dev" target="_blank">
          <img src={reactLogo} className="logo react" alt="React logo" />
        </a>
      </div>
      <h1>Vite + React - CI-CD</h1>
      <div className="card">
        <button onClick={() => setCount((count) => count + 1)}>
          count is {count}
        </button>

        <button onClick={() => handleCountDoubleButtonClick()} style={{marginLeft: 10}}>
          countDouble is {countDouble}
        </button>
        <p>
          Edit <code>src/App.tsx</code> and save to test HMR
        </p>
      </div>
      <p className="read-the-docs">
        Designed by Khanh Khuu
      </p>
    </>
  )
}

export default App
