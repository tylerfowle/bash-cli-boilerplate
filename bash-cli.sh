#!/usr/bin/env bash

ProgName="$(basename $0)"
ProgVersion="0.0.1"

# print the name & version
sub_version(){
  echo "$ProgName $ProgVersion"
}

# help
sub_help(){
  printf "$ProgName $ProgVersion\n\n"
  printf "Usage:\n"
  printf "\t$ProgName <subcommand> [options]\n\n"
  printf "Subcommands:\n"
  printf "\thelp,--help,-h\tdisplay this help\n"
  printf "\tversion,--version,-v\tdisplay the version information\n"
  printf "\t[command_name]\trun the [command_name]"
  printf "\n"
}

subcommand=$1
case $subcommand in
  "" | "-h" | "--help")
    sub_help
    ;;
  "-v" | "--version")
    sub_version
    ;;
  *)
    shift
    sub_${subcommand} $@
    if [ $? = 127 ]; then
      echo "Error: '$subcommand' is not a known subcommand." >&2
      echo "       Run '$ProgName --help' for a list of known subcommands." >&2
      exit 1
    fi
    ;;
esac


