import React from 'react'
import { getPlayerImage, hex2rgba } from '../../utils'
import NameBadge from './name_badge'

const PlayerCard = ({ player }) => (
  <div
    className={`player-card qa-details-${player.id}`}
    style={{ backgroundColor: hex2rgba(player.teamColor, 0.4) }}
  >
    <div className="player-card__image-wrapper">
      <img className="player-card__image" src={getPlayerImage(player.id)} />
    </div>
    <div className="player-card__stats">
      <NameBadge {...player} />
      <PrimaryStats
        points={player.points}
        assists={player.assists}
        rebounds={player.rebounds}
      />
      <SecondaryStats
        steals={player.steals}
        blocks={player.blocks}
        minutes={player.minutes}
        teamColor={player.teamColor}
        turnovers={player.turnovers}
      />
    </div>
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
