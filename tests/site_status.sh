FAIL_CODE=6

check_status(){
    LRED="\033[1;31m" # Light Red
    LGREEN="\033[1;32m" # Light Green
    NC='\033[0m' # No Color


    curl -sf "${1}" > /dev/null

    if [ ! $? = ${FAIL_CODE} ];then
        echo -e "${LGREEN}${1} is online${NC}"
    else
        echo -e "${LRED}${1} is down${NC}"
    fi
}


check_status "${1}"