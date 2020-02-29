#!/usr/bin/env swipl

:- use_module(library(prolog_pack)).

:- dynamic(nomicmu_packs_dir/1).
nomicmu_packs_dir('./nomicmu_packs').
  
:- multifile(user:file_search_path/2).
:- dynamic(user:file_search_path/2).
% user:file_search_path(pack, Dir):- 
%  user:file_search_path(nomicmu_packs_dir, Dir).
user:file_search_path(nomicmu_packs, Dir) :- 
  nomicmu_packs_dir(Dir).


find_or_install_nomicmu_pack(Name):- 
  format(atom(URL),'https://github.com/TeamSPoon/~w.git',[Name]),
  pack_install(URL, [upgrade(true),interactive(false)]). 

/*
attach_packs:- 
   nomicmu_packs_dir(LPD),
   make_directory_path(LPD), 
   absolute_file_name(LPD,R,[file_type(directory)]),
   (R==LPD -> true ;
     (retractall(nomicmu_packs_dir(LPD)),
       asserta(nomicmu_packs_dir(R)))),
   attach_packs(R,[duplicate(replace)]).
*/
install_nomicmu_packs:-   
   maplist(find_or_install_nomicmu_pack,
     [ logicmoo_nlu,
       logicmoo_base,
       wam_common_lisp,
       pfc,
       dictoo, 
       gvar_syntax,
       predicate_streams,
       body_reordering,
       instant_prolog_docs,
       multimodal_dcg,
       %prologmud,
       %prologmud_samples,
       logicmoo_utils]),   
   pack_list_installed.


compile_nomicmu_packs.

% :- attach_packs.

:-  
  install_nomicmu_packs ->
  compile_nomicmu_packs -> 
  true.


%  stored in logicmoo_nlu currently
:- user:ensure_loaded(library(nomic_mu)).

%:- mu:srv_mu(4004).

%:- prolog.



   

