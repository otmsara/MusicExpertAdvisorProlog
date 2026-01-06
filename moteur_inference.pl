% FICHIER: moteur_inference.pl - VERSION CORRIGÉE

% Règles d'évaluation - CORRECTION IMPORTANTE
recommandable(Nom) :-
    artiste(Nom, Attributs),
    member(streams(S), Attributs),  % CORRIGÉ: streams pas stream
    S > 1000000,
    member(engagement(E), Attributs),
    (E = excellent; E = bon).  % excellent OU bon

potentiel_commercial(Nom, eleve) :-
    artiste(Nom, Attributs),
    member(genre(G), Attributs),
    potentiel_genre(G, eleve),
    member(scene(S), Attributs),
    S = fort.

% Calcul du score
calculer_score(Nom, Score) :-
    artiste(Nom, Attributs),
    member(streams(S), Attributs),
    member(engagement(E), Attributs),
    member(scene(Sc), Attributs),
    score_streams(S, S1),
    score_engagement(E, S2),
    score_scene(Sc, S3),
    Score is S1 + S2 + S3.

score_streams(S, 10) :- S > 2000000, !.
score_streams(S, 7) :- S > 1000000, S =< 2000000, !.
score_streams(S, 4) :- S > 500000, S =< 1000000, !.
score_streams(S, 1) :- S =< 500000.

score_engagement(excellent, 10).
score_engagement(bon, 7).
score_engagement(moyen, 4).
score_engagement(faible, 1).

score_scene(fort, 10).
score_scene(moyen, 6).
score_scene(faible, 2).