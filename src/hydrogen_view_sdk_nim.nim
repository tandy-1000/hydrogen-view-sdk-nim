import
  std/[jsffi, dom],
  nodejs/jsurl,
  utils

func importModule*(module: cstring) {.importjs: "import #".}

template importFromModule*(module, library: static[cstring]) =
  assert(cond = (module.len > 0 and library.len > 0), msg = "Argument must not be empty string")
  {.emit: ["import ", module, " from '", library, "';"].}

func newPlatform*(container2: Element, assetPaths, config: JsObject, options, cryptoExtras: JsObject = nil): JsObject {.importjs: "new Platform(@)".}

# wrapModule("hydrogen-view-sdk"):
#   proc Platform*(container2: Element, assetPaths, config: JsObject, options, cryptoExtras: JsObject = nil): JsObject
