import React from 'react';
import { Link } from 'react-router-dom';

export const Notification = ({ children, className = '' }) => {
  return (
    <div className={`notification ${className}`}>
        {children}
    </div>
  );
};

export const Box = ({ children, title, subtitle, to = '/', img = '' }) => {
  return (
    <Link className="box" to={to}>
      <h3 className="title is-4">{title}</h3>
      <h4 className="subtitle is-5">{subtitle}</h4>
      {children}
      <figure className="image is-4by3">
        <img src={img} alt={title} />
      </figure>
    </Link>
  );
};
