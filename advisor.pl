% A simple course advisor system
% The user interface

% Initialization procedures
start:-
    reconsult('temp.pl'),nl,
    reconsult('kb.pl'),nl,
    menu.

% Saves new temporary info for use by inference engine
save:-
    write('Saving data'),nl,
    tell('temp.pl'),
    listing(grade),
    told,
    write('Done'),nl.

% Clears all temporary data from temporary data file
clear:-
    abolish(grade/2),
    tell('temp.pl'),
    told.

prompt_grade(Subject, Title):-
    write("Enter "),
    write(Title),
    write(" grade: "),
    read(Grade),
    assert(grade(Subject, Grade)).

%Displays menu to user
menu:-
    clear, /* Clear existing facts before asking for new ones */
    prompt_grade(mat, "Mathematics"),
    prompt_grade(chem, "Chemistry"),
    prompt_grade(phy, "Physics"),
    save.
