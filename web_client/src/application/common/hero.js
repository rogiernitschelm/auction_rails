import React from 'react';

export const Hero = ({ children, title, subtitle }) => {
  return (
    <section className="hero">
      <div className="hero-body">
        <div className="container">
          <h1 className="title">{title}</h1>
          <h2 className="subtitle">{subtitle}</h2>
          {children}
        </div>
      </div>
    </section>
  );
};

export const HeroFullHeight = ({ children }) => {
  return (
    <section className="hero is-fullheight is-dark is-bold">
      <div className="hero-body">
        <div className="container">
          {children}
        </div>
      </div>
    </section>
  );
};
