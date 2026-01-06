% FICHIER: interface.pl - VERSION FINALE WINDOWS

% Menu principal
demarrer :-
    nl,
    writeln('================================='),
    writeln('   MUSIC EXPERT ADVISOR SYSTEM   '),
    writeln('================================='),
    nl,
    writeln('MENU PRINCIPAL:'),
    writeln('1. Evaluer un artiste'),
    writeln('2. Lister tous les artistes'),
    writeln('3. Trouver artistes recommandables'),
    writeln('4. Calculer score'),
    writeln('5. Quitter le systeme'),
    nl,
    write('Votre choix (1-5): '),
    read(Choix),
    traiter_choix(Choix).

% Traitement des choix
traiter_choix(1) :-
    evaluer_artiste.

traiter_choix(2) :-
    lister_artistes.

traiter_choix(3) :-
    trouver_recommandables.

traiter_choix(4) :-
    calculer_score_menu.

traiter_choix(5) :-
    nl,
    writeln('Merci d\'avoir utilise Music Expert Advisor.'),
    writeln('Au revoir!'),
    halt.

traiter_choix(_) :-
    nl,
    writeln('ERREUR: Choix invalide.'),
    writeln('Veuillez entrer un nombre entre 1 et 5.'),
    nl,
    demarrer.

% Après chaque action, retour au menu
apres_action :-
    nl,
    write('Appuyez sur Entree pour retourner au menu...'),
    read_line(_),
    demarrer.

% Évaluer un artiste
evaluer_artiste :-
    nl,
    writeln('=== EVALUATION D\'ARTISTE ==='),
    nl,
    writeln('Artistes disponibles dans la base:'),
    writeln('- amy (pop)'),
    writeln('- leo (hiphop)'),
    writeln('- sara (jazz)'),
    nl,
    write('Entrez le nom de l\'artiste: '),
    read(Nom),
    analyser_artiste(Nom),
    apres_action.

% Analyser un artiste
analyser_artiste(Nom) :-
    (artiste(Nom, Attributs) ->
        nl,
        writeln('=== RAPPORT D\'ANALYSE ==='),
        writeln('========================'),
        nl,
        
        % Afficher les informations
        write('NOM: '), writeln(Nom),
        
        member(genre(G), Attributs), 
        write('GENRE MUSICAL: '), writeln(G),
        
        member(streams(S), Attributs), 
        write('NOMBRE DE STREAMS: '), format('~D', [S]), writeln(' streams'),
        
        member(engagement(E), Attributs), 
        write('ENGAGEMENT: '), writeln(E),
        
        member(scene(Sc), Attributs), 
        write('PRESENCE SCENIQUE: '), writeln(Sc),
        
        member(age(A), Attributs), 
        write('AGE: '), writeln(A),
        
        member(origine(O), Attributs), 
        write('ORIGINE: '), writeln(O),
        
        nl,
        writeln('--- EVALUATION ---'),
        
        % Calcul du score
        calculer_score(Nom, Score),
        write('SCORE TOTAL: '), writeln(Score),
        write('NOTE: '),
        (Score >= 20 -> writeln('EXCELLENT (20-30)')
        ; Score >= 15 -> writeln('BON (15-19)')
        ; Score >= 10 -> writeln('MOYEN (10-14)')
        ; writeln('FAIBLE (0-9)')),
        
        nl,
        writeln('--- RECOMMANDATION ---'),
        (recommandable(Nom) ->
            writeln('>>> RECOMMANDE: OUI'),
            writeln('>>> DECISION: A SIGNER!')
        ;
            writeln('>>> RECOMMANDE: NON'),
            writeln('>>> DECISION: Ne pas signer pour le moment')
        ),
        
        (potentiel_commercial(Nom, eleve) ->
            nl,
            writeln('>>> POTENTIEL COMMERCIAL: ELEVE')
        ; true)
    ;
        nl,
        writeln('ERREUR: Artiste non trouve.'),
        writeln('Les artistes valides sont: amy, leo, sara')
    ).

% Lister tous les artistes
lister_artistes :-
    nl,
    writeln('=== LISTE DES ARTISTES ==='),
    nl,
    findall(Nom, artiste(Nom, _), Liste),
    (Liste = [] ->
        writeln('Aucun artiste dans la base.')
    ;
        writeln('Artistes enregistres:'),
        forall(member(Artiste, Liste), (
            artiste(Artiste, Attributs),
            member(genre(G), Attributs),
            write('- '), write(Artiste), write(' ('), write(G), writeln(')')
        ))
    ),
    nl,
    write('Total: '), length(Liste, N), write(N), writeln(' artistes'),
    apres_action.

% Trouver artistes recommandables
trouver_recommandables :-
    nl,
    writeln('=== ARTISTES RECOMMANDABLES ==='),
    nl,
    findall(Nom, recommandable(Nom), Liste),
    (Liste = [] ->
        writeln('Aucun artiste ne remplit tous les criteres de recommandation.')
    ;
        writeln('Artistes recommandables (criteres remplis):'),
        forall(member(Artiste, Liste), (
            write('* '), writeln(Artiste)
        ))
    ),
    apres_action.

% Calculer score (menu)
calculer_score_menu :-
    nl,
    writeln('=== CALCUL DE SCORE ==='),
    nl,
    write('Entrez le nom de l\'artiste: '),
    read(Nom),
    (calculer_score(Nom, Score) ->
        nl,
        write('ARTISTE: '), writeln(Nom),
        write('SCORE: '), writeln(Score),
        write('INTERPRETATION: '),
        (Score >= 20 -> writeln('Excellent')
        ; Score >= 15 -> writeln('Bon')
        ; Score >= 10 -> writeln('Moyen')
        ; writeln('Faible'))
    ;
        nl,
        writeln('ERREUR: Impossible de calculer le score.'),
        writeln('Verifiez le nom de l\'artiste.')
    ),
    apres_action.

% Lire une ligne (pour la pause)
read_line(Line) :-
    read_line_to_string(user_input, Line).