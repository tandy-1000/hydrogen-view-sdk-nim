import std/[jsffi, asyncjs]
import abortableOperation

type
  PasswordLoginMethod* = ref object of JsRoot
    username*: cstring
    password*: cstring
    homeserver*: cstring

  LoginOptions* = ref object of JsRoot
    homeserver*: cstring
    password*: PasswordLoginMethod
    sso*: SSOLoginHelper
    token*: TokenLoginMethod


## Platform class

func newPlatform*(container2: Element, assetPaths, config: JsObject, options, cryptoExtras: JsObject = nil): JsObject {.importjs: "new Platform(@)".}

# func setNavigation*(platform: JsObject, navigation: JsObject) {.importc.}


## Client class

func newClient*(platform: JsObject): JsObject {.importjs: "new Client(@)".}

func qeuryLogin*(client: JsObject, homeserver: cstring): LoginOptions {.importjs: "$1(@)".}


## PasswordLoginMethod class

func newPasswordLoginMethod(username, password, homeserver: cstring): PasswordLoginMethod {.importjs: "new PasswordLoginMethod({ @ })".}

func login*(hsApi, deviceName, log: cstring)


## AbortableOperation class

func newAbortableOperation*(run: JsObject): JsObject {.importjs: "new AbortableOperation(@)".}
