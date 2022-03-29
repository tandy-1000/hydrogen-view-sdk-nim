# Package

version       = "0.1.0"
author        = "tandy"
description   = "Nim bindings for hydrogen-view-sdk"
license       = "MIT"
srcDir        = "src"


# Dependencies

requires "nim >= 1.7.1"

task deps, "Download hydrogen-view-sdk...":
  exec "npm add hydrogen-view-sdk"

task buildtest, "Preparing test...":
  exec "nim -o:tests/hydrogen-view-sdk-nim/test.js js tests/test.nim"
  exec "cd tests/hydrogen-view-sdk-nim && yarn build && yarn dev"
