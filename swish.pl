go:- hypothesize(Restaurant),
      write('I guess that the Restaurant is: '),
      write(Restaurant),
      nl,
      undo. 

/* calling */

/* Layan */
hypothesize(masti):- masti, !.
hypothesize(ayamna):- ayamna, !.
hypothesize(okku):- okku, !.
hypothesize(avenueDiner):- avenueDiner, !.
hypothesize(fatto):- fatto, !.
/* Teif */
hypothesize(avliByTashas):- avliByTashas, !.
hypothesize(hakkoku):- hakkoku, !.
hypothesize(carbon):- carbon, !.
hypothesize(cucinaItaliana):- cucinaItaliana, !.
hypothesize(tabreez):- tabreez, !.

/* Samah */
hypothesize(il_borro_tuscan_bistro):- il_borro_tuscan_bistro, !.
hypothesize(mirai):- mirai, !.
hypothesize(il_Ristorante):- il_Ristorante, !.
hypothesize(acacia):- acacia, !.
hypothesize(threeFILS):- threeFILS, !.

hypothesize(unknown).


/*******************************/

/* Dubai Restaurants */
masti:- dubai,
	asian,
	indian,
	quality,
           verify(multi_award_winning).

ayamna:- dubai,
    middleEastern,
	lebanese,
	quality,
           verify(vegetarian_Friendly).

avliByTashas:- dubai,
    european,
	greek,
	quality,
    verify(it_was_visited_by_sheikh_hamdan_al_maktoum).

il_borro_tuscan_bistro:- dubai,
    european,
	italian,
	quality,
           verify(time_Out_Dubai_Award_Winner).


threeFILS:- dubai,
    asian,
	japanese,
	quality,
           verify(premium_Asian_dishes_with_a_Japanese_twist),
           verify(awarded_two_Michelin_stars).


il_Ristorante:- dubai,
    european,
    italian,
	quality,
           verify(gluten_free_foods).

/*Riyadh Restaurants*/
okku:- riyadh,
    asian,
    japanese,
	quality,
           verify(traditional_Japanese_Geisha_profiles).

avenueDiner:- riyadh,
    northAmerican,
    american,
	quality,
           verify(halal_grill_options).

hakkoku:- riyadh,
    asian,
    japanese,
	quality,
           verify(japanese_food).

carbon:- riyadh,
    northAmerican,
    american,
	quality,
           verify(visited_by_kylie_jenner).  


acacia:- riyadh,
    european,
    italian,
	quality,
           verify(the_chef_won_3Michelin_stars).

/*Manama Restaurants*/
cucinaItaliana:- manama,
    european,
    italian,
	quality,
           verify(outdoor).

fatto:-  manama,
    european,
    italian,
	quality,
           verify(gluten_free_options).

tabreez:- manama,
    middleEastern,
    arabic,
    quality,
    verify(seaFood).


mirai:- manama,
    asian,
    japanese,
	quality,
           verify(the_Best_Restaurant_in_Bahrain2022).


/*Attributes*/
/*By cuisine*/
japanese:- verify(services_japanese_cuisine), !.
lebanese:- verify(services_lebanese_cuisine), !.
american:- verify(services_american_cuisine), !.
italian:- verify(services_italian_cuisine), !.
greek:- verify(services_greek_cuisine), !.
indian:- verify(services_indian_cuisine), !.
arabic:- verify(services_arabic_cuisine), !. 


/*By origin*/
asian:- verify(comes_from_East_Asia), !.
middleEastern:- verify(comes_from_the_Middle_East), !.
northAmerican:- verify(comes_from_North_America), !.
european:- verify(comes_from_Europe), !.

/*By cites*/
dubai:- verify(located_in_Dubai), !. 
riyadh:- verify(located_in_Riyadh), !. 
manama:- verify(located_in_Manama), !.


/*By Quality*/
quality:- verify(four_Stars), !.
quality:- verify(five_stars), !.


/*Asks the questions*/

ask(Question) :-	
    write('The Restaurant that you are looking for is it: '),
    write(Question),
    write('? '),
    read(Response),
    nl,
    ( (Response == yes ; Response == y)
      ->
       assert(yes(Question)) ;
       assert(no(Question)), fail).

:- dynamic yes/1,no/1.
verify(S) :-
   (yes(S) 
    ->
    true ;
    (no(S)
     ->
     fail ;
     ask(S))).

undo :- retract(yes(_)),fail. 
undo :- retract(no(_)),fail.
undo.