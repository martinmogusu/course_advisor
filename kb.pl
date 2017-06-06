% Courses knowledge base.

:- dynamic grade/2.

% Confirms if the grade for the specified unit meets the minimum
% requirement

confirm_grade(Unit, Threshold):-
    grade(Unit, GradePoints), GradePoints >= Threshold.


% Confirms whether any of the units provided meets the
% specified threshold

any_meets_threshold(Unit1, Unit2, Unit3, Unit4, Unit5, Threshold):-
    grade(Unit1, Unit1Points), Unit1Points >= Threshold;
    grade(Unit2, Unit2Points), Unit2Points >= Threshold;
    grade(Unit3, Unit3Points), Unit3Points >= Threshold;
    grade(Unit4, Unit4Points), Unit4Points >= Threshold;
    grade(Unit5, Unit5Points), Unit5Points >= Threshold.


% Define conditions necessary to take given courses

can_take(computer_science):-
    confirm_grade(mat, 12),
    confirm_grade(chem, 12),
    confirm_grade(phy, 11),
    any_meets_threshold(bio,chem,_,_,_, 10).

can_take(computer_technology):-
    confirm_grade(mat, 11),
    confirm_grade(chem, 8),
    confirm_grade(phy, 9),
    any_meets_threshold(bio,chem,_,_,_, 9).


% Advices on courses one should take
should_take(X):-
    setof(X, can_take(X), Courses), member(X, Courses).
