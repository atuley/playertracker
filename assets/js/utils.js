import _ from 'lodash'

export const search = (searchQuery, players) => {
  const lowercaseQuery = _.toLower(searchQuery)
  return _.filter(players, player =>
    _.chain(player)
      .values()
      .toLower()
      .includes(lowercaseQuery)
      .value()
  )
}

export const getPlayerImage = id =>
  `https://ak-static.cms.nba.com/wp-content/uploads/headshots/nba/latest/260x190/${id}.png`

export const getTeamImage = tricode =>
  `https://www.nba.com/assets/logos/teams/primary/web/${tricode}.svg`

export const hex2rgba = (hex, alpha = 1) => {
  const [r, g, b] = hex.match(/\w\w/g).map(x => parseInt(x, 16))
  return `rgba(${r},${g},${b},${alpha})`
}
