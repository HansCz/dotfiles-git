#!/bin/bash - 

SELF="$0"
SELF_BASENAME=`basename "$SELF"`

#===============================================================================
#
##         USAGE:  ./install.sh [--home_path <home directory>] \
##                              [--source_path <path to gitignore and gitconfig>] \
##                              | [-h|--help]
## 
##   DESCRIPTION:  an install script for my git config
## 
##       OPTIONS:  --home_path <home path>
##
##                   This option specifies where to put .gitignore and 
##                   .gitconfig links to gitignore and gitconfig files in this repo
##
##                     Default: ~
##
##                 --source_path <path to gitignore and gitconfig>
##
##                   This option specifies where the gitignore and 
##                   gitconfig files are to be found
##
##                     Default: current working directory
##
##                 -h or --help
##                   
##                   Prints this text and exits
##
##          FILE:  install.sh
##
##  REQUIREMENTS:  none
##  DEPENDENCIES:  GNU bash, version 3.2.48
##               
##
##          BUGS:  none known
##         NOTES:  
##        AUTHOR:  Hans Czajkowski Jørgensen, hans.c.jorgensen@gmail.com
##       COMPANY:  
##       CREATED:  12/10/2012
##       VERSION:  0.0.1
##    REPOSITORY:  git://github.com/HansCz/dotfiles-git.git
##       CREDITS:  
##                 usage function - http://www.thelinuxdaily.com/2012/09/self-documenting-scripts/ 
##                 Retrieved last on 12/10/2012
##
##                 option parsing - http://vimeo.com/21538711 (CRAZY Bash Programming with Wayne E Seguin and Haris Amin)
##                 Retrieved last on 12/10/2012
##                 
#===============================================================================

#------------------------------------------------------------------------------
# To avoid unforeseen consequences of faulty input values,
# treat unset variables as an error
#------------------------------------------------------------------------------

set -o nounset                          

#-------------------------------------------------------------------------------
#  So that external scripts will return their error codes to this script, do:
#-------------------------------------------------------------------------------

set -o pipefail 

HOME=~
SOURCE_PATH=`pwd`

function usage () {
  local DEFAULT_PREFIX='##'
  if [[ $# -ge 1 ]]; then
    local PREFIX="$1"
  else
    local PREFIX=$DEFAULT_PREFIX  
  fi
  grep "^$PREFIX" "$SELF" | sed -e "s/^$PREFIX//" -e "s/_SELF_/$SELF_BASENAME/" 1>&2
}

if [ $# -gt 0 ]; then
  while [ $# -gt 0 ]; do
    case $1 in
      --home_path )    shift
                              HOME=$1
                              ;;
      --source_path )  shift
                              SOURCE_PATH=$1
                              ;;
      -h | --help )           usage
                              exit
                              ;;
      * )                     usage
                              # handle unparsed arguments here, e.g.
                              # die `log fail "Invalid arguments: $@"`;;
    esac
    shift
  done
else
  # Since it is valid to supply no options, no code should be run here.
  # however, it is a nice placeholder, should this case be needed in the future.
  # The problem is, that an else block has to run something to be registered,
  # so we run true, which is essentially a no-op.
  true
fi

