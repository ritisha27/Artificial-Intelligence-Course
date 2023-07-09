:- [facts].
:- [heuristics].

% to increase the stack limit
stack_limit :- set_prolog_flag(stack_limit, 2_147_483_648).
cls :- write('\33\[2J').

% starting of the code. First we will type the command "start.".
start:-
    stack_limit,
    cls,
    write('Hello! I will help you to find the best route between two cities.'),nl,nl,
    write('You are provided with 2 searching options, you can choose either of them.'),nl,
    write('Type [DFS] for Depth First Seacrh Option.'),nl,
    write('Type [BestFS] for Best First Seacrh Option.'),nl,
    read(Opt),
    choice(Opt).


choice('DFS'):-
    write('Welcome to DFS Search.'),nl,nl,
    write('Note: Please Enter in the form of string.'),nl,
    write('Please enter the starting city: '),
    read(Src),nl,
    write('Please Enter the destination city: '),
    read(Dest),nl,
    dfs(Src,Dest,Path_DFS,Cost_DFS),
    write('The path from '),write(Src),write(' to '),write(Dest),write(': '),write(Path_DFS),nl,
    write('The distance from '),write(Src),write(' to '),write(Dest),write(': '),write(Cost_DFS),nl.

choice('BestFS'):-
    write('Welcome to Best First Search.'),nl,nl,
    write('Note: Please Enter in the form of string.'),nl,
    write('Please Enter the starting city: '),
    read(Src),nl,
    write('Please Enter the destination city: '),
    read(Dest),nl,
    bestFS([[Src]],Dest,Route,_),
    write('The path from '),write(Src),write(' to '),write(Dest),write(': '),write(Route),nl,
    write('Note: The output i.e. the path is in reverse order.'),nl,nl,
    path_cost(Route, X),
    write('The appox distance from '),write(Src),write(' to '),write(Dest),write(': '),write(X),nl,nl.


% Depth First Seacrh
dfs(Src,Dest,[Src|Next],Cost):-
    connected(Src,Dest,Next,Cost).

% direct path rule
connected(Src,Dest,[Dest],Cost):-
    dist(Src,Dest,Cost).

% indirect path rule
connected(Src,Dest,[Mid|L],Cost):-
    dist(Src,Mid,Cost1),
    connected(Mid,Dest,L,Cost2),
    Cost is Cost1 + Cost2.

% to handle bidirectionality of roads
dist(X,Y,D):- distance(X,Y,D).
dist(X,Y,D):- distance(Y,X,D).

% Best First Search
bestFS([[Dest|Route]|_], Dest, [Dest|Route], 0).
bestFS([Route|Row],Dest,FinalRoute, Distance_BFS) :-
    find_successor(Route, NewRoutes),
    append(Row,NewRoutes,Row_One),
    sort_row(Row_One, NewRow),
    bestFS(NewRow, Dest, FinalRoute, Distance),
    Distance_BFS is Distance+1.


% sort the nodes w.r.t their costs
sort_row(L,L2) :-
    swapping(L,L1), !,
    sort_row(L1,L2).
sort_row(L,L).


% swapping nodes according to the heuristic value.
swapping([[A1|B1],[A2|B2]|T],[[A2|B2],[A1|B1]|T]) :-
    heuristic(A1,W1),
    heuristic(A2,W2),
    W1>W2.
swapping([X|T],[X|V]) :- swapping(T,V).


% utility program to explore adjacent nodes
find_successor([Node|Route],NewRoute) :-
   findall([NewNode,Node|Route],
   (dist(Node, NewNode, _), \+ member(NewNode, Route)), NewRoute).

path_cost([Start,End],Cost) :- dist(Start,End,Cost).
path_cost([Start,End|Mid],Cost) :-
    dist(Start,End,Cost1),
    path_cost([End|Mid],Cost2),
    Cost is Cost1+Cost2.
