:- dynamic grade/2.
% Courses knowledge base.



% Confirms if the grade for the specified unit meets the minimum
% requirement

confirm_grade(Unit, Threshold):-
    grade(Unit, GradePoints), GradePoints >= Threshold.


% Confirms whether any of the units provided meets the
% specified threshold

any_meets_threshold(Unit1, Unit2, Unit3, Unit4, Unit5, Unit6, Threshold):-
    grade(Unit1, Unit1Points), Unit1Points >= Threshold;
    grade(Unit2, Unit2Points), Unit2Points >= Threshold;
    grade(Unit3, Unit3Points), Unit3Points >= Threshold;
    grade(Unit4, Unit4Points), Unit4Points >= Threshold;
    grade(Unit5, Unit5Points), Unit5Points >= Threshold;
    grade(Unit6, Unit6Points), Unit6Points >= Threshold.

% Advices on courses one should take
should_take(X):-
    setof(X, can_take(X), Courses), member(X, Courses).


% Define conditions necessary to take given courses

can_take(hospitality_and_tourism_management):-
    any_meets_threshold(eng,kis,_,_,_,_, 10),
    confirm_grade(mat, 10),
    any_meets_threshold(bio,chem,phy,geo,his,cre,9),
    any_meets_threshold(bio,chem,geo,his,cre,opt-unit, 9).

can_take(catering_and_hotel_management):-
    any_meets_threshold(eng,kis,_,_,_,_, 10),
    confirm_grade(mat, 10),
    any_meets_threshold(bio,chem,phy,geo,his,cre,9),
    any_meets_threshold(bio,chem,geo,his,cre,opt-unit, 9).

can_take(development_studies):-
    any_meets_threshold(eng,kis,_,_,_,_, 9),
    any_meets_threshold(mat,bio,chem,phy,_,_, 9),
    any_meets_threshold(his,geo,cre,_,_,_, 8),
    any_meets_threshold(bio,chem,phy,opt_unit,_,_, 8).

can_take(guidance_and_counselling):-
    any_meets_threshold(eng,kis,_,_,_,_, 9),
    any_meets_threshold(mat,bio,chem,phy,_,_, 9),
    any_meets_threshold(his,geo,cre,_,_,_, 8),
    any_meets_threshold(bio,chem,phy,opt_unit,_,_, 8).


can_take(computer_science):-
    confirm_grade(mat, 12),
    confirm_grade(chem, 11),
    confirm_grade(phy, 10),
    any_meets_threshold(bio,chem,his,cre,geo,opt_unit,10 ).

can_take(computer_technology):-
    confirm_grade(mat, 11),
    confirm_grade(chem, 8),
    confirm_grade(phy, 9),
    any_meets_threshold(bio,chem,his,cre,geo,opt_unit, 9).


can_take(analytic_chemistry):-
    confirm_grade(mat, 11),
    confirm_grade(phy, 11),
    confirm_grade(chem, 10),
    any_meets_threshold(bio,geo,his,cre,opt_unit,_, 9).

can_take(bio_chemistry):-
    confirm_grade(bio, 11),
    confirm_grade(chem, 11),
    any_meets_threshold(mat,phy,_,_,_,_, 10),
    any_meets_threshold(eng,kis,his,geo,cre,opt_unit, 9).


