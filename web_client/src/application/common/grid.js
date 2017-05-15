import React from 'react';

export const Container = ({ children, className = '' }) => {
  return (
    <div className={`container ${className}`}>
      {children}
    </div>
  );
};

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

export const TileAncestor = ({ children, className = '' }) => {
  return (
    <div className={`tile is-ancestor ${className}`}>
      {children}
    </div>
  );
};

export const TileParent = ({ children, className = '' }) => {
  return (
    <div className={`tile is-parent ${className}`}>
      {children}
    </div>
  );
};

export const TileChild = ({ children, className = '' }) => {
  return (
    <article className={`tile is-child ${className}`}>
      {children}
    </article>
  );
};

export const Section = ({ children }) => {
  return (
    <section className="section">
      <div className="container">
        {children}
      </div>
    </section>
  );
};
