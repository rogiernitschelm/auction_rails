import React from 'react';
import { Hero } from 'common';
import { connect } from 'react-redux';
import { mapStateToProps } from 'authentication';
import LoginComponent from '../shared/login_form';

const Welcome = props => {
  const renderLogin = () => {
    if (!props.authenticated) {
      return <LoginComponent />;
    }
  };

  return (
    <div>
      <Hero
        title="Reclameveiling"
        subtitle="Adverteren tot je erbij neervalt."
        className={`is-${props.authenticated ? 'large' : 'medium'} is-bold is-primary`}
      >

        {renderLogin()}

      </Hero>
      {/* <Container>
        <TileAncestor>
          <TileParent>
            <TileChild className="has-text-centered notification is-primary">
              <IconLink icon="android" />
            </TileChild>
            <TileChild className="has-text-centered notification is-primary">
              <IconLink icon="android" />
            </TileChild>
            <TileChild className="has-text-centered notification is-primary">
              <IconLink icon="android" />
            </TileChild>
          </TileParent>
        </TileAncestor>
      </Container> */}

      {/* <Container>
        <Columns className="is-multiline">
          <Column className="is-one-third">
            <Box
              title="Voordelig adverteren"
              subtitle="Lorem ipsum bla di bla"
              img="https://placeholdit.imgix.net/~text?txtsize=33&txt=350%C3%97150&w=350&h=150"
            />
          </Column>
          <Column className="is-one-third">
            <Box
              title="Voordelig adverteren"
              subtitle="Lorem ipsum bla di bla"
              img="https://placeholdit.imgix.net/~text?txtsize=33&txt=350%C3%97150&w=350&h=150"
            />
          </Column>
          <Column className="is-one-third">
            <Box
              title="Voordelig adverteren"
              subtitle="Lorem ipsum bla di bla"
              img="https://placeholdit.imgix.net/~text?txtsize=33&txt=350%C3%97150&w=350&h=150"
            />
          </Column>
        </Columns>
      </Container> */}

    </div>
  );
};

export default connect(mapStateToProps)(Welcome);
