#!/usr/bin/env bats

#wslpath testing
@test "wslpath - No parameter" {
  run src/wslpath
  [ "${lines[0]}" = "wslpath (-w|-d|-u|-m|-r) [-D|-A|-T|-S|-W|-s|-su|-H|-P|...NAME...]" ]
  [ "${lines[1]}" = "wslpath (-h|-v|-R)" ]
  [ "$status" -eq 20 ]
}

@test "wslpath - Help" {
  run src/wslpath --help
  [ "${lines[0]}" = "wslpath - Component of Windows 10 Linux Subsystem Utility" ]
  [ "${lines[1]}" = "Usage: wslpath (-w|-d|-u|-m|-r) [-D|-A|-T|-S|-W|-s|-su|-H|-P|...NAME...]" ]
  [ "${lines[2]}" = "wslpath (-h|-v|-R)" ]
  [ "${lines[3]}" = "For more help for wslpath, visit the following site:" ]
  [ "${lines[4]}" = "http://garage.patrickwu.cf/man/wslu/wslpath" ]
}

@test "wslpath - Help - Alt." {
  run src/wslpath -h
  [ "${lines[0]}" = "wslpath - Component of Windows 10 Linux Subsystem Utility" ]
  [ "${lines[1]}" = "Usage: wslpath (-w|-d|-u|-m|-r) [-D|-A|-T|-S|-W|-s|-su|-H|-P|...NAME...]" ]
  [ "${lines[2]}" = "wslpath (-h|-v|-R)" ]
  [ "${lines[3]}" = "For more help for wslpath, visit the following site:" ]
  [ "${lines[4]}" = "http://garage.patrickwu.cf/man/wslu/wslpath" ]
}
@test "wslpath - Available Registery" {
  run src/wslpath --avail-reg
  [ "${lines[0]}" = "Available registery input:" ]
}

@test "wslpath - Available Registery - Alt." {
  run src/wslpath -R
  [ "${lines[0]}" = "Available registery input:" ]
}

@test "wslpath - No parameter - Windows Double DirPath" {
  run src/wslpath "C:\\Windows"
  [ "${lines[0]}" = "/mnt/c/Windows" ]
}

@test "wslpath - No parameter - Windows DirPath" {
  run src/wslpath "C:\Windows"
  [ "${lines[0]}" = "/mnt/c/Windows" ]
}

@test "wslpath - No parameter - Linux DirPath" {
  skip "WIP feature"
  run src/wslpath "/mnt/c/Windows"
  [ "${lines[0]}" = "C:\\Windows" ]
}

@test "wslpath - /w parameter - No Input" {
  run src/wslpath -w
  [ "${status}" -eq 21 ]
}