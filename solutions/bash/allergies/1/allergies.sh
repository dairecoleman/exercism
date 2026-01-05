#!/usr/bin/env bash
allergy_names=("eggs" "peanuts" "shellfish" "strawberries" "tomatoes" "chocolate" "pollen" "cats")
allergy_values=(1 2 4 8 16 32 64 128) 
known_allergens=""
# calc number representing allergens we know
echo "256 modulo of input: $1"
known_allergen_sum=$(($1 % 256))
echo "$known_allergen_sum is the known allergen sum."


# check if allergy value divides $1. if it does appendcorresponding allergy to list.
for i in $(seq 7 -1 0);
do
   remainder=$((known_allergen_sum % allergy_values[i])) 
   echo "Trying ${allergy_names[$i]}, ans. $remainder"
   if [ $remainder -ne $known_allergen_sum ]; then 
	   echo "allergen found"
	   known_allergen_sum=$((known_allergen_sum - allergy_values[i]))
	   known_allergens+=" ${allergy_names[$i]}"
	   echo "known allergies; $known_allergens"
   fi
done

echo "Done. Known allergens: $known_allergens"
#echo "${allergy_names[1]}"
#echo "${allergy_values[6]}"
