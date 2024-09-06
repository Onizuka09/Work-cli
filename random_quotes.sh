#!/bin/bash


# JPATH="./test.json"

JPATH="./motivate/20.json"
# JITEMV1_NAME="name"
# JITEMV2_NAME="color"

JITEMV1_NAME="quote"
JITEMV2_NAME="author"


declare -A Quote=( ["${JITEMV1_NAME}"]="" ["${JITEMV2_NAME}"]="")

get_quote(){

local max_items=$(jq ".data[].${JITEMV2_NAME}" ${JPATH} | wc -l)

local rand_num=$(( 0 + $RANDOM % ${max_items} ))
# echo $rand_num
# get the q and the auth 
local q_select=$rand_num
local info=$(jq ".data[${q_select}]" ${JPATH})
local v1=$(echo ${info} | jq -r ".${JITEMV1_NAME}" )
local v2=$(echo ${info} | jq -r ".${JITEMV2_NAME}")

# echo ${info}
# echo ${v1}
# echo ${v2}

Quote["${JITEMV1_NAME}"]="${v1}"
Quote["${JITEMV2_NAME}"]="${v2}"
# echo ${Quote}
}
# get_quote

# echo ${Quote["name"]}
# echo ${Quote["color"]}
