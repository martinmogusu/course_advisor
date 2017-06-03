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
    listing(mat),
    listing(chem),
    listing(phy),
    told,
    write('Done'),nl.

% Clears all temporary data from temporary data file
clear:-
    abolish(mat/1),
    abolish(chem/1),
    abolish(phy/1),
    tell('temp.pl'),
    told.

%Displays menu to user
menu:-
    clear, /* Clear existing facts before asking for new ones */
    write("Enter mathematics grade: "),
    read(MatGrade),
    assert(mat(MatGrade)),
    write("Enter chemistry grade: "),
    read(ChemGrade),
    assert(chem(ChemGrade)),
    write("Enter physics grade: "),
    read(PhyGrade),
    assert(phy(PhyGrade)),
    save.
