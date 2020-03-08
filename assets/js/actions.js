export const fetchPlayers = () => dispatch => {
  dispatch({ type: 'FETCH_PLAYERS_REQUEST' })
  fetch('/api/players')
    .then(response => response.json())
    .then(players =>
      dispatch({
        type: 'FETCH_PLAYERS_OK',
        payload: players.players
      })
    )
    .catch(() => dispatch({ type: 'FETCH_PLAYERS_ERROR' }))
}

export const fetchStats = () => dispatch => {
  dispatch({ type: 'FETCH_STATS_REQUEST' })
  fetch('/api/stats')
    .then(response => response.json())
    .then(response =>
      dispatch({
        type: 'FETCH_STATS_OK',
        payload: response.stats
      })
    )
    .catch(() => dispatch({ type: 'FETCH_STATS_ERROR' }))
}

export const followPlayer = id => dispatch => {
  dispatch({ type: 'FOLLOW_PLAYER_REQUEST' })
  fetch('/api/follow', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ id })
  })
    .then(() => {
      dispatch({ type: 'FOLLOW_PLAYER_OK' })
      dispatch(fetchPlayers())
      dispatch(fetchStats())
    })
    .catch(() => dispatch({ type: 'FOLLOW_PLAYER_ERROR' }))
}

export const unfollowPlayer = id => dispatch => {
  dispatch({ type: 'UNFOLLOW_PLAYER_REQUEST' })
  fetch('/api/unfollow', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ id })
  })
    .then(() => {
      dispatch({ type: 'UNFOLLOW_PLAYER_OK' })
      dispatch(fetchPlayers())
      dispatch(fetchStats())
    })
    .catch(() => dispatch({ type: 'UNFOLLOW_PLAYER_ERROR' }))
}
