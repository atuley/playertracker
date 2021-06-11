import React from 'react'
import { getPlayerImage, hex2rgba } from '../../utils'
import NameBadge from './name_badge'
import FollowButton from '../following/follow_button'

const PlayerCard = ({ player, loading }) =>
  loading ? (
    <div>Loading.. </div>
  ) : (
    <div
      className={`player-card qa-details-${player.id}`}
      style={{ backgroundColor: hex2rgba(player.teamColor, 0.4) }}
    >
      <div className="u-flex">
        <div className="player-card__image-wrapper">
          <img className="player-card__image" src={getPlayerImage(player.id)} />
        </div>
        <NameBadge {...player} />
      </div>
      <div className="player-card__stats u-mb-16">
        <PrimaryStats {...player} />
        <SecondaryStats {...player} />
      </div>
      <FollowButton player={player} />
    </div>
  )

const PrimaryStats = ({ points, assists, rebounds }) => (
  <div className="stats">
    <span className="stats__primary">{points}</span>
    <span className="stats__abrv">PTS</span>
    <span className="stats__primary">{assists}</span>
    <span className="stats__abrv">AST</span>
    <span className="stats__primary">{rebounds}</span>
    <span className="stats__abrv">REB</span>
  </div>
)

const SecondaryStats = ({ steals, blocks, minutes, turnovers }) => (
  <div className="stats">
    <span className="stats__secondary">{steals}</span>
    <span className="stats__abrv">STL</span>
    <span className="stats__secondary">{blocks}</span>
    <span className="stats__abrv">BLK</span>
    <span className="stats__secondary">{turnovers}</span>
    <span className="stats__abrv">TO</span>
    <span className="stats__secondary">{minutes}</span>
    <span className="stats__abrv">MIN</span>
  </div>
)

export default PlayerCard
