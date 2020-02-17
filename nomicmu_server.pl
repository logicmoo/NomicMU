:- use_module(library(prolog_pack)).

:- dyanamic(nomicmu_pack_dir/1).
nomicmu_pack_dir('./local_packs').
  
:- multifile(user:file_search_path/2).
:- dynamic(user:file_search_path/2).
user:file_search_path(pack, Dir):-
  user:file_search_path(nomicmu_pack_dir, Dir).
user:file_search_path(nomicmu_pack_dir, Dir) :- 
  nomicmu_pack_dir(R).

install_nomicmu_pack(Name):- 
  pack_property(Name,_)
   ->true;
   pack_install(Name, [package_directory(nomicmu_pack_dir('.'))]). 


install_nomicmu:- 
   nomicmu_pack_dir(LPD),
   make_directory(LPD), 
   abolute_file_name(LPD,R,[file_type(directory)]),
   (R==LPD -> true ;
     (retractall(nomicmu_pack_dir(LPD)),
       asserta(nomicmu_pack_dir(R)))),
   attach_packs(R,[duplicate(repalce)]),
   maplist(install_nomicmu_pack,
     [ logicmoo_nlu,
       % pfc,
       % dictoo
       logicmoo_utils]),
   
   list_installed_packages.
     
     
   
%:- pack_install(prologmud_samples).
