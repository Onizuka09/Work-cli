#!/bin/bash
source ./asciiArts.sh
source ./random_quotes.sh

# declare -A Quote=( ["${JITEMV1_NAME}"]="" ["${JITEMV2_NAME}"]="")
# JPATH="./motivate/200.json"
# JITEMV1_NAME="quote"
# JITEMV2_NAME="author"
HOUR=0
MIN=1
SEC=10; 
TERM_WIDTH=$(tput cols)

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
LIGHT_GREEN='\033[0;36m'
RESET='\033[0m'
PINK='\033[0;35m'


render_ASCII(){
  local text="$1"
  while IFS= read -r line; do 
    printf "%*s\n\r" $(( (${#line} + ${TERM_WIDTH}) / 2  )) "$line"
  done <<<"$text"
}

render_line_center(){
  local line="$1" 
  
  printf "%*s\n\r" $(( (${#line} + ${TERM_WIDTH}) / 2  )) "${line}" 
}

render_time(){
  local text="$1"
  printf "%*s \033[0K\r" $(( ( ${#text} + ${TERM_WIDTH} ) / 2  )) "$text"
}
timer(){ 
while [ $HOUR -ge 0 ]; do 
while [ $MIN -ge 0 ]; do 
  while [ $SEC -ge 0 ]; do 
    # TODO: fix time print to be this format 00:00:00 not 0:0:0 (done)
    [[ ${HOUR} -le 9 ]] && HOUR_STR="0${HOUR}" ||  HOUR_STR=${HOUR}     
    [[ ${MIN} -le 9  ]] &&  MIN_STR="0${MIN}"  ||  MIN_STR=${MIN}  
    [[ ${SEC} -le 9  ]] &&  SEC_STR="0${SEC}"  ||  SEC_STR=${SEC}      
    local time_str="Time: ${HOUR_STR}:${MIN_STR}:${SEC_STR}"
    render_time "$time_str" 
    sleep 1
    let "SEC=SEC-1"
  done 
  SEC=59
  let "MIN=MIN-1"
done 
MIN=59
let "HOUR=HOUR-1"
done 

}
set_proverb_text(){
get_quote

local line=${Quote["quote"]}
echo -e ${LIGHT_GREEN}
  printf "%*s\n\r" $(( (${#line} + ${TERM_WIDTH}) / 2  )) "${line}" 
  line=${Quote["author"]}
 printf "%*s\n\r" $(( (${#line} + ${TERM_WIDTH}) / 2  )) "${line}" 

  echo -e ${RESET} 

}
set_time(){
echo -e "${BLUE}"
timer 
echo -e "${RESET}"
}
set_date(){

  echo -e "${PINK}"
  daa="$(date)"
  li="DATE: ${daa}"
  render_line_center "${li}"
  echo -e "${RESET}"
}

run(){
render_ASCII "${fireworks_city}" 
set_proverb_text
set_date 
set_time
echo "Work Done"
}
run 

