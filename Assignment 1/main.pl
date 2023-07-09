cls :- write('\33\[2J').

% defining facts.
listAIchoicehigh(['Advanced Computer Vision','Natural Language Processing (CSE556)','Bayesian Machine Learning','Image Analysis','Advanced Biometrics']).
listAIchoicemedd(['Robotics','Computer Vision','Probability and Random Processes','Information Retrievel','Data Mining']).
listDEchoicehigh(['Statistical Machine Learning (CSE542)','Probabilistic Graphical Models (CSE561 )','Distributed Data Mining','Mining Large Networks (CSE559)','Natural Language Processing (CSE556)']).
listDEchoicemedd(['Data Mining (CSE506)','Information Retrieval (CSE508)','Cloud Computing (CSE569)','	Machine Learning (CSE543)','Database System Implementation (CES507)']).
listISchoicehigh(['Distributed Systems Security (CSE530)','Network Protocol Security (CSE649)','Ethical Hacking (CSE798A)','Mobile and Cellular Network Security (CSE647)','Ethical Hacking (CSE798A)']).
listISchoicemedd(['Foundations to Computer Security (CSE545)','Network Security (CSE550)','Security Engineering (CSE552)','Theory of Modern Cryptography (CSE524)']).
listGenchoicehigh(['Modern Algorithm Design(CSE519)','Mobile Computing (CSE535)','Compiler (CSE601)','Randomized Algorithms (CSE523)']).
listGenchoicemedd(['Graduate Algorithms (CSE525)','Wireless Networks (CSE638 )','Information Retrieval (CSE508)','Program Analysis (CSE503)']).

% starting of the code. First we will type the command "advice.".
advice:-
    reconsult('C:/Users/HP/Desktop/Prolog/Ass1_AI/temporary.pl'),nl,
    cls,
    write('System: Please Enter your name: '),nl,
    write('Note: Please Enter text in the form of string(single apostrophe) with a full stop.'),nl,
    write('You: '),read(Name),nl,
    write('System: Hello '),write(Name),write('!!'),nl,
    write('System: This is an advisory system which will suggest you the electives based on the cgpa you have and Specialization you choose.'),nl,nl,
    write('System: What is the current CGPA going on?'),nl,write('If first sem student then enter 0)'),nl,
    write('Note: Please Enter CGPA in the form of string(single apostrophe) with a full stop.'),nl,
    write('You: '),
    read(Cgpa),nl,nl,
    atom_number(Cgpa,Y),
    (Y=\=0 ->
        write('System: We offer different courses and specialisations.'),nl,write('System: What are you interested in.?'),nl,
        write('Note: Please enter input as specified in [] square braces in the form of string(single apostrophe) with a full stop.'),nl,
        write('1) General degree [General]'),nl,
        write('2) Artificial Intelligence specialisation [AI]'),nl,
        write('3) Information Security specialisation [IS]'),nl,
        write('4) Data Engineering specialisation [DE]'),nl,
        read(Ans),nl,
        check(Cgpa,Ans),
        true
    ;
    freshers()).


check(Cgpa,Ans):-
    % write('inside check'),nl,
    atom_number(Cgpa,X),            % convert to integer
    
    (X>=8->                         % depending on cgpa we will suggest subjects.
        % write('hi >8'),
        choice_high(Ans),
        true
    ;
    (X<8->
        choice_medium(Ans),
        true
    )).

iterate_list([]).                   % base case
iterate_list([H|T]):- write(H),nl,iterate_list(T).

choice_high('AI'):-                 % cgpa>=8.
    write('System: Based on the Cgpa and specialisation choosen, these subjects are appropraite to take: '),nl,
    listAIchoicehigh(X),    
    (iterate_list(X);true),nl,nl.

choice_high('General'):-
    write('System: Based on the Cgpa and specialisation choosen:-'),nl,write('These subjects are appropraite to take: '),nl,nl,
    listGenchoicehigh(X),    
    (iterate_list(X);true),nl,nl.


choice_high('DE'):-
    write('System: Based on the Cgpa and specialisation choosen:-'),nl,write('These subjects are appropraite to take: '),nl,nl,
    listDEchoicehigh(X),    
    (iterate_list(X);true),nl,nl.

choice_high('IS'):-
    write('System: Based on the Cgpa and specialisation choosen:-'),nl,write('These subjects are appropraite to take: '),nl,nl,
    listISchoicehigh(X),    
    (iterate_list(X);true),nl,nl.

choice_medium('AI'):-               % cgpa<8.
    write('System: Based on the Cgpa and specialisation choosen:-'),nl,write('These subjects are appropraite to take: '),nl,nl,
    listAIchoicemedd(X),    
    (iterate_list(X);true),nl,nl.

choice_medium('DE'):-
    write('System: Based on the Cgpa and specialisation choosen:-'),nl,write('These subjects are appropraite to take: '),nl,nl,
    listDEchoicemedd(X),    
    (iterate_list(X);true),nl,nl.

choice_medium('IS'):-
    write('System: Based on the Cgpa and specialisation choosen:-'),nl,write('These subjects are appropraite to take: '),nl,nl,
    listISchoicemedd(X),    
    (iterate_list(X);true),nl,nl.

choice_medium('General'):-
    write('System: Based on the Cgpa and specialisation choosen:-'),nl,write('These subjects are appropraite to take: '),nl,nl,
    listGenchoicemedd(X),    
    (iterate_list(X);true),nl,nl.
    
freshers():-
    % maths strong? database strong? cn strong? 
    write('System: Lets explore courses together for you.'),nl,
    write('Note: Please Enter every entry in the form of string(single apostrophe) with a full stop.'),nl,
    write('System: What was your Cgpa in Btech?'),nl,
    write('You: '),read(Btechcg),nl,nl,
    % write('System: Are you gate/non gate stuudent?'),
    % read(Status),nl,
    write('System: From below listed subjects of Btech, which captures your interest more?'),nl,
    write('1) Mathematics. [Maths]'),nl,
    write('2) Database Management System. [DBMS]'),nl,
    write('3) Computer Networks. [CN]'),nl,
    % write('4) Opearing Syatem [OS]') ,nl,
    write('Note: Please enter input as specified in [] square braces in the form of string(single apostrophe) with a full stop.'),nl,
    write('You:  '),read(Subj),nl,
    domain(Subj).


domain('DBMS'):-
    instruction_menu,
    dbms_list,
    write('System: To check the suggested electives type eligible(X) as next command.').

domain('CN'):-
    instruction_menu,
    cn_list,
    write('System: To check the suggested electives type eligible(X) as next command.').

domain('Maths'):-
    instruction_menu,
    maths_list,
    write('System: To check the suggested electives type eligible(X) as next command.').

instruction_menu:-
    nl,
    write('System: Rate yourself from 0 to 4.'),nl,nl,
    write('0 => no knowledge/interest'),nl,
    write('1 => low knowledge/interest'),nl,
    write('2 => med knowledge/interest'),nl,
    write('3 => high knowledge/interest'),nl,
    write('4 => proficiency knowledge/interest'),nl,nl,
    write('Note: Please enter in the form of number followed by a full stop.'),nl.


% questions asked iff it has interest in dbms.
dbms_list:-
    clear,nl,
    write('Please answer the following questions:'),nl,      
    levelofinterest('Database System Implementation (CES507)',"Designing and developing databases?"),
    levelofinterest('Database Methods in Information Retrieval',"Retrieving data from a database management system?"),
    levelofinterest('Information Integration and Application (CSE656)',"Compiling data from multiple sources into a single data repository.?"),
    save.       % save the fact in file.

maths_list:-
    clear,nl,
    write('Please answer the following questions:'),nl,
    levelofinterest('Bayesian Machine Learning (BML)',"Interested in constructing statistical models based on Baye's Theorem"),
    levelofinterest('Statistical Machine Learning (CSE542)',"Interest in Statistics on the scale of ?"),
    levelofinterest('Probability and Random Processes (ECE501)',"Interest in Probablity on the scale of?"),
    levelofinterest('Data Mining (CSE506)',"Aspiring to work on large datasets?"),
    save.

cn_list:-
    clear,nl,
    write('Please answer the following questions:'),nl,
    levelofinterest('Foundations to Computer Security (CSE545)',"Want to learn basic security concepts?"),
    levelofinterest('Ethical Hacking (CSE798A)',"Have interest in ethical hacking?"),
    levelofinterest('Network Anonymity and Privacy (CSE749)',"Want to work on securing the perwsonal privacy?"),
    save.

% to clear all temporary data from temporary file.
clear:-
    abolish(interest/2),
    tell('C:/Users/HP/Desktop/Prolog/Ass1_AI/temporary.pl'),
    told.


% assert is used to store in memory.
levelofinterest(Subject,Ques):-
    write(Ques),write(': '),nl,
    read(Level),
    assert(interest(Subject,Level)).


save:-                  % saves into temporary.pl
    tell('C:/Users/HP/Desktop/Prolog/Ass1_AI/temporary.pl'),
    listing(interest),
    told.


eligible(X):-
    subject(X).

checking(X):-
    interest(X,Level),
    Level >=2.

subject('Bayesian Machine Learning (BML)'):-
    checking('Bayesian Machine Learning (BML)'),
    nl,
    write('BML'),nl.

subject('Statistical Machine Learning (CSE542)'):-
    checking('Statistical Machine Learning (CSE542)'),
    nl,
    write('SML'),nl.

subject('Probability and Random Processes (ECE501)'):-
    checking('Probability and Random Processes (ECE501)'),
    nl,
    write('Probability and Random Processes'),nl.


subject('Data Mining (CSE506)'):-
    checking('Data Mining (CSE506)'),
    nl,
    write('DM'),nl.

subject('Database System Implementation (CES507)'):-
    checking('Database System Implementation (CES507)'),
    nl,
    write('Database System Implementation'),nl.

subject('Database Methods in Information Retrieval'):-
    checking('Database Methods in Information Retrieval'),
    nl,
    write('Database Methods in Information Retrieval'),nl.

subject('Information Integration and Application (CSE656)'):-
    checking('Information Integration and Application (CSE656)'),
    nl,
    write('IIA'),nl.

subject('Foundations to Computer Security (CSE545)'):-
    checking('Foundations to Computer Security (CSE545)'),
    nl,
    write('FCS'),nl.

subject('Ethical Hacking (CSE798A)'):-
    checking('Ethical Hacking (CSE798A)'),
    nl,
    write('Ethical Hacking'),nl.

subject('Network Anonymity and Privacy (CSE749)'):-
    checking('Network Anonymity and Privacy (CSE749)'),
    nl,
    write('Network Anonymity and Privacy'),nl.  









    