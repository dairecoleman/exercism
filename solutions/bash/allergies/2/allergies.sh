#!/usr/bin/env bash
allergy_names=("eggs" "peanuts" "shellfish" "strawberries" "tomatoes" "chocolate" "pollen" "cats")
allergy_values=(1 2 4 8 16 32 64 128) 
known_allergens=()
# calc number representing allergens we know
#echo "256 modulo of input: $1"
known_allergen_sum=$(($1 % 256))
#echo "$known_allergen_sum is the known allergen sum."

# $2 is the subcommand

# check if allergy value divides $1. if it does appendcorresponding allergy to list.
for i in $(seq 7 -1 0);
do
   remainder=$((known_allergen_sum % allergy_values[i])) 
   #echo "Trying ${allergy_names[$i]}, ans. $remainder"
   if [ $remainder -ne $known_allergen_sum ]; then 
	   #echo "allergen found"
	   known_allergen_sum=$((known_allergen_sum - allergy_values[i]))
	   #known_allergens=("${allergy_names[$i]}")
	   #("${allergy_names[$i]}")+=
	   known_allergens=("${allergy_names[$i]}" "${known_allergens[@]}")
	   #echo "known allergies;" "${known_allergens[@]}"
   fi
done

# at this point have checked all allergies and added them to list if found
# return true or false for subcommand 'is_allergic and a given allergy string'

if [ "$2" == "allergic_to" ]; then # check if $3 is in known allergens
	for i in "${known_allergens[@]}"; do
		if [ "$3" == "$i" ]; then
			echo "true"
			exit
		fi
	done
	echo "false"
fi

# return list of detected allergies for 'list' subcommand
if [ "$2" == "list" ]; then # print array of known allergens reverse ordered because 
	printf '%s\n' "${known_allergens[*]}"
	#echo "${known_allergens[@]}" | od -An -tx1
fi
