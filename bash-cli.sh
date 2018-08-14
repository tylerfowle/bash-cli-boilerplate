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

  print_columns "help,--help,-h" "display this help"
  print_columns "version,--version,-v" "display the version information"
  print_columns "[command_name]" "run the [command_name]"
  printf "\n"
}

print_columns(){
  printf "\t%-30s %-30s\n" "$1" "$2"
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
