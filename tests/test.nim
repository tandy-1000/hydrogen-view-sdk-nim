import
  ../src/hydrogen_view_sdk_nim/[classes, functions],
  ../src/utils,
  std/[jsffi, dom, asyncjs]

importFromModule("{ Platform, Client, LoadStatus, createNavigation, createRouter, RoomViewModel, TimelineView }", "hydrogen-view-sdk")

importUrlFrom(downloadSandboxPath, "downloadSandboxPath", "hydrogen-view-sdk/download-sandbox.html?url")
importUrlFrom(workerPath, "workerPath", "hydrogen-view-sdk/main.js?url")
importUrlFrom(olmWasmPath, "olmWasmPath", "@matrix-org/olm/olm.wasm?url")
importUrlFrom(olmJsPath, "olmJsPath", "@matrix-org/olm/olm.js?url")
importUrlFrom(olmLegacyJsPath, "olmLegacyJsPath", "@matrix-org/olm/olm_legacy.js?url")

var assetPaths = js{
  downloadSandbox: downloadSandboxPath,
  worker: workerPath,
  olm: js{
    wasm: olmWasmPath,
    legacyBundle: olmLegacyJsPath,
    wasmBundle: olmJsPath
  }
}

importModule("hydrogen-view-sdk/style.css")

proc main {.async.} =
  let
    app = document.querySelector("#app")
    assetPaths = newJsObject()
    config = newJsObject()
    platform = newPlatform(app, assetPaths, config)
    navigation = createNavigation()
  platform.setNavigation(navigation)
  let urlRouter = createRouter(js{
    navigation: navigation,
    history: platform.history
  })
  urlRouter.attach()
  let
    client = newClient(platform)
    loginOptions = client.queryLogin("matrix.org")
  client.startWithLogin(loginOptions.password("USERNAME", "PASSWORD"))
  client.loadStatus()


discard main()
