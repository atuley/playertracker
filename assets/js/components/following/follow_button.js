import React from 'react'
import { connect } from 'react-redux'
import { followPlayer, unfollowPlayer } from '../../actions'

const FollowButton = ({ player, followPlayer, unfollowPlayer }) =>
  player.followed ? (
    <button
      className={`primary-btn--red qa-unfollow-${player.id}`}
      onClick={() => {
        unfollowPlayer(player.id)
      }}
    >
      Unfollow
    </button>
  ) : (
    <button
      className={`primary-btn qa-follow-${player.id}`}
      onClick={() => {
        followPlayer(player.id)
      }}
    >
      Follow
    </button>
  )

export default connect(null, {
  followPlayer,
  unfollowPlayer
})(FollowButton)
