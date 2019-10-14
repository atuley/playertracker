import { combineReducers } from 'redux'

const rootReducer = (
  state = {
    loading: false,
    players: [],
    following: [],
    error: null
  },
  action
) => {
  switch (action.type) {
    case 'FETCH_PLAYERS_REQUEST':
      return {
        ...state,
        loading: true
      }
    case 'FETCH_PLAYERS_OK':
      return {
        ...state,
        loading: false,
        players: action.payload
      }
    case 'FETCH_PLAYERS_ERROR':
      return {
        ...state,
        loading: false
      }
    case 'FETCH_STATS_REQUEST':
      return {
        ...state,
        loading: true
      }
    case 'FETCH_STATS_OK':
      return {
        ...state,
        loading: false,
        following: action.payload.details.concat(state.following)
      }
    case 'FETCH_STATS_ERROR':
      return {
        ...state,
        loading: false
      }
    default:
      return state
  }
}

export default combineReducers({ rootReducer })
