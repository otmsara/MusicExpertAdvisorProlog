% Base de faits
artiste(amy, [
    genre(pop),
    streams(2500000),
    engagement(bon),
    reseaux([instagram, tiktok]),
    scene(fort),
    age(24),
    origine(usa)
]).

artiste(leo, [
    genre(hiphop),
    streams(800000),
    engagement(excellent),
    reseaux([instagram, youtube]),
    scene(moyen),
    age(22),
    origine(france)
]).

artiste(sara, [
    genre(jazz),
    streams(300000),
    engagement(moyen),
    reseaux([instagram]),
    scene(faible),
    age(30),
    origine(uk)
]).

% Critères de succès par genre
potentiel_genre(pop, eleve).
potentiel_genre(hiphop, eleve).
potentiel_genre(edm, moyen).
potentiel_genre(jazz, faible).
potentiel_genre(rock, moyen).

% Marchés porteurs par genre
marche_porteur(pop, [usa, europe, asie]).
marche_porteur(hiphop, [usa, france, uk]).
marche_porteur(latin, [usa, espagne, mexique]).