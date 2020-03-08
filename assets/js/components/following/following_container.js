import React, { Component } from 'react'
import { connect } from 'react-redux'
import Following from './following'
import { fetchStats } from '../../actions'

class FollowingContainer extends Component {
  componentDidMount = () => {
    this.props.fetchStats()
  }

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
  following: state.rootReducer.following,
  loading: state.rootReducer.loading
})

export default connect(mapStateToProps, {
  fetchStats
})(FollowingContainer)
