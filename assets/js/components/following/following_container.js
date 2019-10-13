import React, { Component } from 'react'
import { connect } from 'react-redux'
import Following from './following'

class FollowingContainer extends Component {
  render() {
    return (
      <div className="following-container container">
        <div className="row">
          <Following {...this.props} />
        </div>
      </div>
    )
  }
}

const mapStateToProps = state => ({
  following: state.rootReducer.following
})

export default connect(mapStateToProps)(FollowingContainer)
