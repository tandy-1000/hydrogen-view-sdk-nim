import std/jsffi

func createRouter*(obj: JsObject): JsObject {.importc.}

func createNavigation*: JsObject {.importc.}
