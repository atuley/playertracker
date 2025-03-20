// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from '../css/app.scss'

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"
import React from 'react'
import { render } from 'react-dom'
import { Provider } from 'react-redux'
import { thunk } from 'redux-thunk'
import rootReducer from './root_reducer'
import { createStore, applyMiddleware, compose } from 'redux'
import SearchContainer from './components/search/search_container'
import FollowingContainer from './components/following/following_container'

const composeEnhancers = window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose
const store = createStore(rootReducer, composeEnhancers(applyMiddleware(thunk)))

render(
  <Provider store={store}>
    <SearchContainer />
    <FollowingContainer />
  </Provider>,
  document.getElementById('root')
)
