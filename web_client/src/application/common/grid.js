import React from 'react';

export const Columns = ({ children, className = '' }) => {
  return (
    <div className={`columns ${className}`}>{children}</div>
  );
};

export const Column = ({ children, className = '' }) => {
  return (
    <div className={`column ${className}`}>{children}</div>
  );
};

export const Tile = ({ children, className = '' }) => {
  return (
    <div className={`tile ${className}`}>
      {children}
    </div>
  );
};
