import React from 'react'
import { getTeamImage } from '../../utils'

const NameBadge = ({ firstName, lastName, number, position, tricode }) => (
  <div className="name-badge">
    <img className="search-result__team-logo" src={getTeamImage(tricode)} />
    <div className="u-ml-8">
      <span className="u-block">
        {firstName} {lastName}
      </span>
      <span className="search-result__pos u-block ">
        #{number} | {position}
      </span>
    </div>
  </div>
)

export default NameBadge
