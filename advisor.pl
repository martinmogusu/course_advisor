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
    listing(interest),
    told,
    write('Done'),nl.

% Clears all temporary data from temporary data file
clear:-
    abolish(grade/2),
    abolish(interest/2),
    tell('temp.pl'),
    told.

prompt_grade(Subject, Title):-
    write("Enter "),
    write(Title),
    write(" points (1 - 12): "),
    read(Grade),
    assert(grade(Subject, Grade)).

prompt_interest(Interest, Title):-
    write("What is your level of interest in "),
    write(Title),
    write(" (1 - 10): "),
    read(Interest_Level),
    assert(interest(Interest, Interest_Level)).

%Displays menu to user
menu:-
    clear, /* Clear existing facts before asking for new ones */
    prompt_grade(mat, "Mathematics"),
    prompt_grade(eng, "English"),
    prompt_grade(kis, "Kiswahili"),
    prompt_grade(chem, "Chemistry"),
    prompt_grade(phy, "Physics"),
    prompt_grade(bio, "Biology"),
    prompt_grade(geo, "Geography"),
    prompt_grade(his, "History"),
    prompt_grade(cre, "CRE"),
    prompt_grade(opt_unit, "optional unit"),

    prompt_interest(technical, "doing technical activities?"),
    prompt_interest(discovery, "discovering new things?"),
    prompt_interest(serving_people, "serving people?"),
    prompt_interest(catering, "catering?"),

    save.
