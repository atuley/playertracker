import React from 'react'
import SearchResult from './search_result'

const Search = ({ handlePlayerSearch, fetchStats, searchResults }) => {
  return (
    <div className="search">
      <input
        placeholder="Search"
        className={`search__field ${searchResults.length &&
          'u-display-results'}`}
        onChange={handlePlayerSearch}
      />
      <table className="search__results" cellPadding="0" cellSpacing="0">
        <tbody>
          {searchResults.map(player => (
            <SearchResult
              key={player.id}
              player={player}
              fetchStats={fetchStats}
            />
          ))}
        </tbody>
      </table>
    </div>
  )
}

export default Search
