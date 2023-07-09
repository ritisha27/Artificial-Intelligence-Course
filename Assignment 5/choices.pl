:- dynamic interest/2.


eligible(X):-
    consult("temporary.pl"),
    subject(X).

checking(X):-
    interest(X,Level),
    Level >=2.


subject('Bayesian Machine Learning (BML)'):-
    checking('Bayesian Machine Learning (BML)'),
    write('BML'),nl.

subject('Statistical Machine Learning (CSE542)'):-
    checking('Statistical Machine Learning (CSE542)'),
    write('SML'),nl.

subject('Probability and Random Processes (ECE501)'):-
    checking('Probability and Random Processes (ECE501)'),
    write('Probability and Random Processes'),nl.


subject('Data Mining (CSE506)'):-
    checking('Data Mining (CSE506)'),
    write('DM'),nl.

subject('Database System Implementation (CES507)'):-
    checking('Database System Implementation (CES507)'),
    write('Database System Implementation'),nl.

subject('Database Methods in Information Retrieval'):-
    checking('Database Methods in Information Retrieval'),
    write('Database Methods in Information Retrieval'),nl.

subject('Information Integration and Application (CSE656)'):-
    checking('Information Integration and Application (CSE656)'),
    write('IIA'),nl.

subject('Foundations to Computer Security (CSE545)'):-
    checking('Foundations to Computer Security (CSE545)'),
    write('FCS'),nl.

subject('Ethical Hacking (CSE798A)'):-
    checking('Ethical Hacking (CSE798A)'),
    write('Ethical Hacking'),nl.

subject('Network Anonymity and Privacy (CSE749)'):-
    checking('Network Anonymity and Privacy (CSE749)'),
    write('Network Anonymity and Privacy'),nl.  
