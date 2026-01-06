% FICHIER: main.pl - VERSION FINALE

% Systeme Expert pour l'Industrie Musicale
% Auteur: [Votre Nom]
% Date: [Date]
% Module: Ingenierie de la Connaissance

% Chargement des modules
:- ensure_loaded('base_connaissances.pl').
:- ensure_loaded('moteur_inference.pl').
:- ensure_loaded('interface.pl').

% Message de demarrage
:- initialization(start).

% Point d'entree
start :-
    writeln('Chargement du Systeme Expert Musical...'),
    writeln('Base de connaissances chargee.'),
    writeln('Moteur d\'inference initialise.'),
    nl,
    demarrer.