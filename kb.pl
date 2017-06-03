% Courses knowledge base.

:- dynamic mat/1.
:- dynamic chem/1.
:- dynamic phy/1.

%Define conditions necessary to take given courses

can_take(computer_science):-
    mat(MatGrade), MatGrade  > 11,
    chem(ChemGrade), ChemGrade > 11,
    phy(PhyGrade), PhyGrade > 11.

can_take(computer_technology):-
    mat(MatGrade), MatGrade  > 10,
    chem(ChemGrade), ChemGrade > 8,
    phy(PhyGrade), PhyGrade > 9.
