% Courses knowledge base.

:- dynamic grade/2.

% Define conditions necessary to take given courses

confirm_grade(Grade, Threshold):-
    grade(Grade, GradePoints), GradePoints >= Threshold.

can_take(computer_science):-
    confirm_grade(mat, 12),
    confirm_grade(chem, 12),
    confirm_grade(phy, 12).

can_take(computer_technology):-
    confirm_grade(mat, 11),
    confirm_grade(chem, 8),
    confirm_grade(phy, 9).

