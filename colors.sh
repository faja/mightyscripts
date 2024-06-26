#!/bin/bash -

# http://www.andrewnoske.com/wiki/Bash_-_adding_color

# tput setaf color  # set text color
# tput smul         # start underline mode
# tput rmul         # exit underline mode
# tput bold         # set bold mode
# tput setab color  # set background color
# tput sgr0         # reset all attributes
# tput setaf 1 bold # its ok to combine these

# colors
#   Black 0
#   Red 1
#   Green 2
#   Yellow 3
#   Blue 4
#   Magenta 5
#   Cyan 6
#   White 7

BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
LIME_YELLOW=$(tput setaf 190)
POWDER_BLUE=$(tput setaf 153)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
BOLD=$(tput bold)
BLINK=$(tput blink)
REVERSE=$(tput smso)
UNDERLINE=$(tput smul)
NORMAL=$(tput sgr0)

echo "${BLACK}BLACK${NORMAL}"
echo "${BLACK}$(tput setab 7)BLACK on white${NORMAL}"
echo "${RED}RED${NORMAL}"
echo "${GREEN}GREEN${NORMAL}"
echo "${YELLOW}YELLOW${NORMAL}"
echo "${BLUE}BLUE${NORMAL}"
echo "${MAGENTA}MAGENTA${NORMAL}"
echo "${CYAN}CYAN${NORMAL}"
echo "${WHITE}WHITE${NORMAL}"
echo "${POWDER_BLUE}POWDER_BLUE${NORMAL}"
echo "${LIME_YELLOW}LIME_YELLOW${NORMAL}"
echo "${BOLD}BOLD${NORMAL}"
echo "${BLINK}BLINK${NORMAL}"
echo "${REVERSE}REVERSE${NORMAL}"
echo "${UNDERLINE}UNDERLINE${NORMAL}"

# oldschool escape
# tldr "\e[<foreground>;<background>;<format>m
# 1-red, 2-green, 3-yellow, 4-blue, 5-magenda, 6-cyan, 7-white
# 3X-foreground, 4X-background

RED="\e[31m"
RED_AND_BOLD="\e[31;1m"
RED_ON_YELLOW="\e[31;43m"
RED_ON_YELLOW_AND_BOLD="\e[31;43;1m"
NORMAL="\e[0m"

echo
echo
echo -e "${RED}RED${NORMAL}"
echo -e "${RED_AND_BOLD}RED and BOLD${NORMAL}"
echo -e "${RED_ON_YELLOW}RED on YELLOW${NORMAL}"
echo -e "${RED_ON_YELLOW_AND_BOLD}RED on YELLOW and BOLD${NORMAL}"
