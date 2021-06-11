/**
 * This works:
 * But if this was import styles from './App.css'; this would also break
 * reloading on save
 */
%%raw(`import './App.css';`)

/**
 * This is what is causing it to break:
 * The issue is that it also tries to export the logo or css file and that
 * for whatever reason causes HMR to stop being able to reload a file.
 *
 * If you edit App.bs.js and remove logo from exports, reload the page, and
 * edit some of the text it will reload as expected.
 */
@module("./logo.svg") external logo: string = "default"

@react.component
let make = () => {
  <div className="App">
    <header className="App-header">
      <img src={logo} className="App-logo" alt="logo" />
      <p>
        {React.string("Edit ")}
        <code> {React.string("src/App.res")} </code>
        {React.string(" and save to reload.")}
      </p>
      <a className="App-link" href="https://reactjs.org" target="_blank" rel="noopener noreferrer">
        {React.string("Learn React")}
      </a>
    </header>
  </div>
}
