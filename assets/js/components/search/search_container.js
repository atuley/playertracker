import React, { Component } from 'react'
import { connect } from 'react-redux'
import Search from './search'
import { fetchPlayers, followPlayer, unfollowPlayer } from '../../actions'
import { search } from '../../utils'

class SearchContainer extends Component {
  state = {
    query: ''
  }

  componentDidMount = () => {
    this.props.fetchPlayers()
  }

  handlePlayerSearch = e => {
    this.setState({ query: e.target.value })
  }

  searchResults = () => {
    const { query } = this.state
    const { players } = this.props
    return query.length ? search(query, players) : []
  }

  render() {
    return (
      <Search
        {...this.props}
        handlePlayerSearch={this.handlePlayerSearch}
        searchResults={this.searchResults()}
      />
    )
  }
}

const mapStateToProps = state => ({
  players: state.rootReducer.players
})

export default connect(mapStateToProps, {
  fetchPlayers
})(SearchContainer)
