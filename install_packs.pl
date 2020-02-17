:- use_module(library(prolog_pack)).

:- dyanamic(nomicmu_pack_dir/1).
nomicmu_pack_dir('./local_packs').

:- nomicmu_pack_dir(LPD),
   make_directory(LPD)nomicmu_pack_dir(LPD), 
   abolute_file_name(LPD,R,[file_type(directory)]),
   (R==LPD -> true ;
     (retractall(nomicmu_pack_dir(LPD)),
       asserta(nomicmu_pack_dir(R)))).
  
:- multifile(user:file_search_path/2).
:- dynamic(user:file_search_path/2).
user:file_search_path(pack, Dir):-
  user:file_search_path(nomicmu_pack_dir, Dir).
user:file_search_path(nomicmu_pack_dir, Dir) :- 
  nomicmu_pack_dir(R).  
    

:- pack_install(logicmoo_nlu, [package_directory(nomicmu_pack_dir('.'))]).
%:- pack_install(prologmud_samples).
