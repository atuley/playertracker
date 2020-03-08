import React from 'react'
import { getPlayerImage, hex2rgba } from '../../utils'
import NameBadge from '../player/name_badge'
import FollowButton from '../following/follow_button'

const SearchResult = ({ player, handleFollowPlayer, handleUnfollowPlayer }) => (
  <tr
    className={`search-result qa-result-${player.id}`}
    style={{
      backgroundColor: hex2rgba(player.teamColor, 0.3)
    }}
  >
    <td className="search-result__player-image-wrapper">
      <img
        className="search-result__player-image"
        src={getPlayerImage(player.id)}
      />
    </td>
    <td className="search-result__badge">
      <NameBadge {...player} />
    </td>
    <td className="search-result__follow-btn">
      <FollowButton player={player} />
    </td>
  </tr>
)

export default SearchResult
