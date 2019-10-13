import React from 'react'
import PlayerCard from '../player/player_card'

const Following = ({ following }) =>
  following.map(player => (
    <div key={player.id} className="col-lg-4 col-md-6 col-xs-12">
      <PlayerCard player={player} />
    </div>
  ))

export default Following
