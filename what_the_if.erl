-module(what_the_if).
-export([heh_fine/0, holy_shit/1, animal_says/1, animal_says_when/1, insert/2, beach/1]).

heh_fine() ->
    if 1 =:= 1 ->
        works
    end,
    if 1 =:= 2; 1 =:= 1 ->
        works
    end,
    if 1 =:= 2, 1 =:= 1 ->
        fails
    end.

holy_shit(N) ->
    if N =:= 2 -> might_succeed;

    true -> always_does

    end.

animal_says_func_head(cat)  -> "meow";
animal_says_func_head(beef)   -> "moo";
animal_says_func_head(dog)  -> "bark";
animal_says_func_head(_) -> "Bogus".

animal_says(Animal) -> 
    Talk =  if Animal == cat -> "meow";
                Animal == beef -> "mooo";
                Animal == dog -> "bark";
                Animal == tree -> "what am I suppose to say?";
                true -> "Bogus"
            end,
    {Animal, "says: " ++ Talk ++ "!"}.

insert(X,[]) ->
    [X];
insert(X,Set) ->
    case lists:member(X, Set) of
        true -> Set;
        false -> [X|Set]
    end.

beach(Temperature) ->
    case Temperature of
        {celsius, N} when N >= 20, N =< 45 ->
            'favorable';
        {kelvin, N} when N >= 293, N =< 318 ->
            'sciencetifically favorable';
        {fahrenheit, N} when N >= 68, N =< 113 ->
            'favorable in the US';
        _ ->
            'avoid beach'
        end.