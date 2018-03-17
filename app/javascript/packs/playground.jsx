import React from 'react'
import ReactDOM from 'react-dom'
// import Playground from 'graphql-playground-react'
import 'graphql-playground-react/playground.css'

ReactDOM.render(
  <Playground endpoint="http://localhost:3000" />,
  document.body
)
