#!/bin/bash - 
#===============================================================================
#
#          FILE:  install.sh
#
#         USAGE:  ./install.sh [--home <home directory>] \
#                              [--source-path <path to gitignore and gitconfig>]  
# 
#   DESCRIPTION:  an install script for my git config
# 
#       OPTIONS:  --home <home path>
#
#                   This option specifies where to put .gitignore and 
#                   .gitconfig links to gitignore and gitconfig files in this repo
#
#                     Default: ~
#
#                 --source-path <path to gitignore and gitconfig>
#
#                   This option specifies where the gitignore and 
#                   gitconfig files are to be found
#
#                     Default: current working directory
#
#  REQUIREMENTS:  none
#  DEPENDENCIES:  GNU bash, version 3.2.48
#               
#
#          BUGS:  none known
#         NOTES:  
#        AUTHOR:  Hans Czajkowski Jørgensen, hans.c.jorgensen@gmail.com
#       COMPANY:  
#       CREATED:  12/10/2012
#       VERSION:  0.0.1
#    REPOSITORY:  git://github.com/HansCz/dotfiles-git.git
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

DEFAULT_HOME=~
DEFAULT_SOURCE_PATH=`pwd`

