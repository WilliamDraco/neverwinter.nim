import sequtils, ospaths, strutils

version       = "1.2.8"
author        = "Bernhard Stöckner <niv@nwnx.io>"
description   = "Neverwinter Nights 1: Enhanced Edition data accessor library and utilities"
license       = "MIT"

requires "nim >= 1.0.2"

installDirs = @["neverwinter"]

binDir = "bin/"
bin = listFiles(thisDir()).
  mapIt(it.splitFile.name).
  filterIt(it.startsWith("nwn_"))

task clean, "Remove compiled binaries and temporary data":
  for b in bin:
    rmFile(binDir / b)
    rmFile(binDir / b & ".exe")
  rmdir(nimcacheDir())
