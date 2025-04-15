#!/bin/bash

# Pretty git log with ASCII art
# Usage: ./git-log-pretty.sh [number of commits to show]

# Default to 10 commits if no argument provided
NUM_COMMITS=${1:-10}

# Check if terminal supports colors
if [ -t 1 ]; then
  # Terminal supports colors
  # ANSI color codes
  GREEN='\033[0;32m'
  YELLOW='\033[0;33m'
  BLUE='\033[0;34m'
  PURPLE='\033[0;35m'
  CYAN='\033[0;36m'
  BOLD='\033[1m'
  NC='\033[0m' # No Color
  
  # Enable color output
  COLOR_ENABLED=true
else
  # Terminal doesn't support colors
  COLOR_ENABLED=false
fi

# Function to print with or without color
print_color() {
  if [ "$COLOR_ENABLED" = true ]; then
    echo -e "$1"
  else
    echo "$2"
  fi
}

# ASCII art for git
if [ "$COLOR_ENABLED" = true ]; then
  echo -e "${BOLD}${GREEN}"
  echo "    ██████╗ ██╗████████╗    ██╗      ██████╗  ██████╗ "
  echo "   ██╔════╝ ██║╚══██╔══╝    ██║     ██╔═══██╗██╔════╝ "
  echo "   ██║  ███╗██║   ██║       ██║     ██║   ██║██║  ███╗"
  echo "   ██║   ██║██║   ██║       ██║     ██║   ██║██║   ██║"
  echo "   ╚██████╔╝██║   ██║       ███████╗╚██████╔╝╚██████╔╝"
  echo "    ╚═════╝ ╚═╝   ╚═╝       ╚══════╝ ╚═════╝  ╚═════╝ "
  echo -e "${NC}"
else
  echo "    GIT LOG"
  echo "    ======="
  echo ""
fi

# Print header
if [ "$COLOR_ENABLED" = true ]; then
  print_color "${BOLD}${YELLOW}┌──────────────────────────────────────────────────────────────────────────────────────────────┐${NC}" "┌──────────────────────────────────────────────────────────────────────────────────────────────┐"
  print_color "${BOLD}${YELLOW}│ ${BOLD}${BLUE}COMMIT${NC} ${BOLD}${YELLOW}│ ${BOLD}${PURPLE}AUTHOR${NC} ${BOLD}${YELLOW}│ ${BOLD}${CYAN}DATE${NC} ${BOLD}${YELLOW}│ ${BOLD}${GREEN}MESSAGE${NC} ${BOLD}${YELLOW}│${NC}" "│ COMMIT │ AUTHOR │ DATE │ MESSAGE │"
  print_color "${BOLD}${YELLOW}├──────────────────────────────────────────────────────────────────────────────────────────────┤${NC}" "├──────────────────────────────────────────────────────────────────────────────────────────────┤"
else
  echo "┌──────────────────────────────────────────────────────────────────────────────────────────────┐"
  echo "│ COMMIT │ AUTHOR │ DATE │ MESSAGE │"
  echo "├──────────────────────────────────────────────────────────────────────────────────────────────┤"
fi

# Git log command with pretty format
if [ "$COLOR_ENABLED" = true ]; then
  git log -n $NUM_COMMITS --pretty=format:"${BOLD}${YELLOW}│ ${BOLD}${BLUE}%h${NC} ${BOLD}${YELLOW}│ ${BOLD}${PURPLE}%an${NC} ${BOLD}${YELLOW}│ ${BOLD}${CYAN}%ad${NC} ${BOLD}${YELLOW}│ ${BOLD}${GREEN}%s${NC} ${BOLD}${YELLOW}│${NC}" --date=short
else
  git log -n $NUM_COMMITS --pretty=format:"│ %h │ %an │ %ad │ %s │" --date=short
fi

# Print footer
if [ "$COLOR_ENABLED" = true ]; then
  print_color "${BOLD}${YELLOW}└──────────────────────────────────────────────────────────────────────────────────────────────┘${NC}" "└──────────────────────────────────────────────────────────────────────────────────────────────┘"
else
  echo "└──────────────────────────────────────────────────────────────────────────────────────────────┘"
fi

# Print branch info
if [ "$COLOR_ENABLED" = true ]; then
  echo -e "\n${BOLD}${CYAN}Current Branch:${NC} $(git branch --show-current)"
  echo -e "${BOLD}${CYAN}Last Commit:${NC} $(git log -1 --pretty=format:"%h - %s")"
  echo -e "${BOLD}${CYAN}Status:${NC} $(git status --short | wc -l) changes"
else
  echo -e "\nCurrent Branch: $(git branch --show-current)"
  echo -e "Last Commit: $(git log -1 --pretty=format:"%h - %s")"
  echo -e "Status: $(git status --short | wc -l) changes"
fi 