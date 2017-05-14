import React from 'react';
import { Link } from 'react-router-dom';

export const IconLink = ({ to = '/', icon, className = 'material-icons' }) => {
  return (
    <Link className="icon" to={to}>
      <i className={className}>{icon}</i>
    </Link>
  );
};
