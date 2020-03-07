import React from 'react'
import SearchResult from './search_result'

const Search = ({ handlePlayerSearch, handleFollowPlayer, searchResults }) => {
  return (
    <div className="search">
      <input
        placeholder="Search"
        className={`search__field qa-search ${searchResults.length &&
          'u-display-results'}`}
        onChange={handlePlayerSearch}
      />
      <table className="search__results" cellPadding="0" cellSpacing="0">
        <tbody>
          {searchResults.map(player => (
            <SearchResult
              key={player.id}
              player={player}
              handleFollowPlayer={handleFollowPlayer}
            />
          ))}
        </tbody>
      </table>
    </div>
  )
}

export default Search
