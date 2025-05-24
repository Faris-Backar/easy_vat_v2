'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "bfe61e286249ff5d10c73ca1a39b06cf",
"assets/AssetManifest.bin.json": "b051eddd8c2392315c82ad43ee91b192",
"assets/AssetManifest.json": "7aed2cd56f9246a76e96eb3cdb34897b",
"assets/assets/fonts/Inter-Black.ttf": "b797a429ef21b9b7d44b96038cdb10f2",
"assets/assets/fonts/Inter-Bold.ttf": "7ef6f6d68c7fedc103180f2254985e8c",
"assets/assets/fonts/Inter-BoldItalic.ttf": "66469edaf106f7a1e14f4061212a1123",
"assets/assets/fonts/Inter-ExtraBold.ttf": "a6ed481bff60bc9270904d214947ab13",
"assets/assets/fonts/Inter-Italic.ttf": "ab4004692577ac82604c777fa83da556",
"assets/assets/fonts/Inter-Light.ttf": "dfaec8b8820224135d07f1b409ceb214",
"assets/assets/fonts/Inter-Medium.ttf": "8540f35bf8acd509b9ce356f1111e983",
"assets/assets/fonts/Inter-Regular.ttf": "37dcabff629c3690303739be2e0b3524",
"assets/assets/fonts/Inter-SemiBold.ttf": "e5532d993e2de30fa92422df0a8849dd",
"assets/assets/fonts/Inter-Thin.ttf": "6f2d2f41f504aee66da88684f15d7e1d",
"assets/assets/fonts/Inter-ThinItalic.ttf": "95d83862ccec5b0d0487f243e34fcc61",
"assets/assets/icons/arrow_back.svg": "2e2447a6a5e44b941d7b228c66d275fe",
"assets/assets/icons/arrow_forward.svg": "1b31d2ca86ec95465bf5da56bffce524",
"assets/assets/icons/bank.svg": "82d7c55ba4c230b8f097a9ef0612a888",
"assets/assets/icons/barcode.svg": "5d3ba1e3d78d102827d2f0ba4201bce1",
"assets/assets/icons/book.svg": "6ef462652165b051f264b7529bd95cbe",
"assets/assets/icons/calendar.svg": "6298ffa9dd6c07d4da5e67d105f5aaa8",
"assets/assets/icons/cart.svg": "54a06692ec7f2bdc3105cb6f4fe2a59d",
"assets/assets/icons/close.svg": "5ba4f1c2f4056c6900f03c563bc56d83",
"assets/assets/icons/contra.svg": "19a704f8ed40a83cea0ee77348be974d",
"assets/assets/icons/credit_note.svg": "917bbff7c76137acd5bd997f16dedc88",
"assets/assets/icons/customer.svg": "77b9973c1feb3d2c154ae4d6a138de4f",
"assets/assets/icons/dark/bank_dark.svg": "30cb094a25284bb52396bcf6c01acc13",
"assets/assets/icons/dark/contra_dark.svg": "b9cd7d21402697a56e0899e738ca227e",
"assets/assets/icons/dark/credit_note_dark.svg": "e9e3de0b2eccfcb3a471bf494e866afa",
"assets/assets/icons/dark/customer_dark.svg": "c75c58dec847020e4d3f55e9e409417a",
"assets/assets/icons/dark/debit_note_dark.svg": "af580d445aeaa3a0dea946447a62f5e9",
"assets/assets/icons/dark/delivery_note_dark.svg": "b47606c3e6168b6f5c0e93ba7f76f830",
"assets/assets/icons/dark/dividend_dark.svg": "3532f688c0210f0aaf132b2351922ccb",
"assets/assets/icons/dark/employee_dark.svg": "f7251149c78da56954a474494c076ae0",
"assets/assets/icons/dark/expanses_dark.svg": "07995bf5ed224d2146ec35ebac526f86",
"assets/assets/icons/dark/income_dark.svg": "50545ee3edc1ba1b04c8ea8fe7af0d4a",
"assets/assets/icons/dark/items_dark.svg": "a3f60266c08979e7c15713474a9bd38d",
"assets/assets/icons/dark/journal_dark.svg": "203ce445f66c51aef7cab60edaf771e6",
"assets/assets/icons/dark/ledger_dark.svg": "a857f2bc8c54cebea89f4e855f474932",
"assets/assets/icons/dark/ledger_group_dark.svg": "e9afb68c5c443a751aa954e1a294f91d",
"assets/assets/icons/dark/payment_dark.svg": "ed7c172aa38fa3e612d423abb880d0d0",
"assets/assets/icons/dark/pos_dark.svg": "857913349861139657d004ad7a00f6e3",
"assets/assets/icons/dark/production_dark.svg": "bddf944a15424356dba5dc3dedcb7260",
"assets/assets/icons/dark/purchase_invoice_dark.svg": "29044be81c2657bcc2a8646c4384d408",
"assets/assets/icons/dark/purchase_order_dark.svg": "334909c0bd800987277004ca0d9d53cf",
"assets/assets/icons/dark/purchase_return_dark.svg": "e9f810bf0c92d025841a4263eeb55bcd",
"assets/assets/icons/dark/reciept_dark.svg": "544f1e52958e6f6e3537627b09b820d7",
"assets/assets/icons/dark/repacking_dark.svg": "d562e302a17fcbd375306fe04cb8a8b0",
"assets/assets/icons/dark/replace_stock_items_dark.svg": "8669b39c3464699632e29adde2d1eb0f",
"assets/assets/icons/dark/salary_payment_dark.svg": "f305a59d20f29044b6ea57f0a71ae3ca",
"assets/assets/icons/dark/salary_processing_dark.svg": "5d05d4cca2f13940dc98a74a5d50bf61",
"assets/assets/icons/dark/sales_inovice_dark.svg": "20f1a7cb3ec70a7487e47c6f6979c22d",
"assets/assets/icons/dark/sales_orders_dark.svg": "ddc72ed90f9884fc888385b3b459cd3b",
"assets/assets/icons/dark/sales_return_dark.svg": "cfc05fc98c5a66effc4b1a78ddcdb3c8",
"assets/assets/icons/dark/service_job_dark.svg": "d0e123136f552cb6e58bbcf6696c52a5",
"assets/assets/icons/dark/settings_selected.svg": "27c603d7469c5d8d8bc3039e79aad956",
"assets/assets/icons/dark/stock_transfer_dark.svg": "adb574bd0cff501079568563a35b1b54",
"assets/assets/icons/dark/store_dark.svg": "7c3a8b1a2b27f941a2db95c3b7c9e6a7",
"assets/assets/icons/dark/supplier_dark.svg": "af9d213d15025397fa73e5c6243eb15e",
"assets/assets/icons/dark/vehicle_registration_dark.svg": "a900f31bf96662aeaa9eb74b4117dbfd",
"assets/assets/icons/dashboard.svg": "3fad7f3218e9af19a9e6d92244305f32",
"assets/assets/icons/debit_note.svg": "04923125445ac7d933b80525ee3ede11",
"assets/assets/icons/delete.svg": "6982596a398c3b0d3b27558063a09cf2",
"assets/assets/icons/delivery_note.svg": "2c164bf933efb09e925735cefda8a59e",
"assets/assets/icons/dividend.svg": "aa2d17c7527058c96eb69aca54d5d5db",
"assets/assets/icons/edit.svg": "0a9ecefa85deae76a9ab54642e605e33",
"assets/assets/icons/employee.svg": "e7d1368af33cf50b9aa69fdaa7033943",
"assets/assets/icons/expenses.svg": "71baf08640efeaa8dac56a43b0449800",
"assets/assets/icons/filter.svg": "fdb473601ff017914bae0e30ce35da83",
"assets/assets/icons/home_selected.svg": "e7e5eac87479d51f1bb3037fd7582261",
"assets/assets/icons/home_unselected.svg": "92254ca025982a68c93b7c2d02719513",
"assets/assets/icons/income.svg": "3024e9fc59362d1fb3dfebbb5a8c6ba9",
"assets/assets/icons/items.svg": "834d3bf34abee2cd9ebfeaa7aac229d9",
"assets/assets/icons/journal.svg": "7aca30d5a05c7b257ce8f500df7de605",
"assets/assets/icons/ledger.svg": "9fa3074d4e7da3343b38cebd8f172fdf",
"assets/assets/icons/ledger_group.svg": "1fc27a0ca767c825922a7d5bb46ad764",
"assets/assets/icons/lock.svg": "acdaaac4ce5c8c8d945cd1c29cca4c53",
"assets/assets/icons/menus.svg": "ce6e6cfaf027519e0f13eb183d74c6b6",
"assets/assets/icons/payment.svg": "17e6626a3de6c5c6a5d0bddf1b002be4",
"assets/assets/icons/pos.svg": "f8c7112abfe47a6a9a451452d6359c4c",
"assets/assets/icons/print.svg": "d0a0f272d9bc8157def7ad18850a88db",
"assets/assets/icons/production.svg": "8227327a427024f1e3165cc270ca2d1d",
"assets/assets/icons/purchase_invoice.svg": "2097ccee71fc07d34be50e0c6b03d18a",
"assets/assets/icons/purchase_order.svg": "797cebfc09fa18ad2f7adc4abd7d7430",
"assets/assets/icons/purchase_return.svg": "14f24ffa4381c996c3f1d1382a58deea",
"assets/assets/icons/reciept.svg": "7b3357513fd69fa8e6aadb8af46efe20",
"assets/assets/icons/repacking.svg": "43fff6e6f21c959adcc5a305f629d2f4",
"assets/assets/icons/replace_stock_items.svg": "f26fa08d8dce28fdc7cd4dcb6df6dcdb",
"assets/assets/icons/report.svg": "f5b84f9e5cfceb899e0e62c2554befd2",
"assets/assets/icons/salary_payment.svg": "a2e5d35995a48128e9e7d782b9a82bf8",
"assets/assets/icons/salary_processing.svg": "a22584f1a13bf56ea5032521528be52d",
"assets/assets/icons/sales.svg": "262d40e49473c139ad5b6d082d0a522c",
"assets/assets/icons/sales_orders.svg": "f37280c2ea069156ed723b9d5169748b",
"assets/assets/icons/sales_return.svg": "cccba0a6d09c5ce5905c5615b8ecc2d6",
"assets/assets/icons/search.svg": "d44165e6b0e4f81fcabebbb657ec8801",
"assets/assets/icons/service_job.svg": "636ec9adccb3de9e2ba52bf45e376d52",
"assets/assets/icons/settings.svg": "3201795a1c28a0ea5f649abaf8b1cc6e",
"assets/assets/icons/settings_selected.svg": "27c603d7469c5d8d8bc3039e79aad956",
"assets/assets/icons/stock_transfer.svg": "fb2789c033b8d6c405acff7720f13bdc",
"assets/assets/icons/store.svg": "fa711f3f3c7a40bef97ace4b2b288bfa",
"assets/assets/icons/supplier.svg": "e8be08b975b857a611f6a2bd57227da8",
"assets/assets/icons/transaction.svg": "af4e5f4b13e7fcdf9f49b335bccf300d",
"assets/assets/icons/vehicle_registration.svg": "7039170c141b84faa38aa624a5fc5559",
"assets/assets/icons/view.svg": "9cd14938049ac5212fac2bb13a1c3b04",
<<<<<<< HEAD
<<<<<<< HEAD
"assets/assets/images/Logo.png": "75b6fd79c7324d5482011caec874f202",
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
"assets/assets/locale/intl_ar.json": "6d752d275f670ad73f61164f5a657646",
"assets/assets/locale/intl_en.json": "303835f91b19a500375cb8bd939e2f43",
"assets/FontManifest.json": "212ed8365f9174e6141c1e7603c60834",
"assets/fonts/MaterialIcons-Regular.otf": "b8787baf73dc4a2c4e5ac5fb3265e687",
=======
"assets/assets/locale/intl_ar.json": "99e28bf9351d325a328a01fbf11fec1b",
"assets/assets/locale/intl_en.json": "11ec4910c547bdfba2ffadc1707af2b6",
"assets/FontManifest.json": "212ed8365f9174e6141c1e7603c60834",
"assets/fonts/MaterialIcons-Regular.otf": "71e9b982e34e1228a5a95d8131c4d4c8",
>>>>>>> c34ef40 (Added Daybook screen with transactions and filters)
=======
"assets/assets/locale/intl_ar.json": "6d752d275f670ad73f61164f5a657646",
"assets/assets/locale/intl_en.json": "303835f91b19a500375cb8bd939e2f43",
"assets/FontManifest.json": "212ed8365f9174e6141c1e7603c60834",
"assets/fonts/MaterialIcons-Regular.otf": "d83631b94917157428fc37447cc53d46",
>>>>>>> 4f76ebf (Changed Pin Login screen visibility issue in dark theme.)
=======
"assets/assets/locale/intl_ar.json": "7367acd0eecdb0c5751a7909f8efce2e",
"assets/assets/locale/intl_en.json": "cb7488d31ca31c92034c225f4b146513",
"assets/FontManifest.json": "212ed8365f9174e6141c1e7603c60834",
"assets/fonts/MaterialIcons-Regular.otf": "1cddcb69e09c805b4c453a8f949f4c67",
>>>>>>> e8c688b (Added Delete Invoice functionality)
"assets/NOTICES": "8b146cb7ffbe5b9308139a97528a792d",
=======
=======
>>>>>>> e360b6b (Added Daybook screen with transactions and filters)
"assets/assets/images/Logo.png": "c9141bbda076a1c4750b0ee3015efebb",
"assets/assets/images/Logo_small.png": "e4b11a525cff12abb32d1b9922e44d98",
"assets/assets/images/no_data_found.png": "9e278296a0b08177fb0f0db6cc7d4d53",
"assets/assets/locale/intl_ar.json": "58c375800517eebb50dc3a5421d54b2b",
"assets/assets/locale/intl_en.json": "43e106a24b38ccb448fbfec0e92760e7",
"assets/FontManifest.json": "212ed8365f9174e6141c1e7603c60834",
"assets/fonts/MaterialIcons-Regular.otf": "636e1de24a50c2da4d92080967e54daf",
"assets/NOTICES": "4709f2a68098954c3d85f07c87b63922",
<<<<<<< HEAD
>>>>>>> d592f14 (Fixed Issues mentioned - 27-5-25)
=======
=======
"assets/assets/images/Logo.png": "75b6fd79c7324d5482011caec874f202",
"assets/assets/locale/intl_ar.json": "6d752d275f670ad73f61164f5a657646",
"assets/assets/locale/intl_en.json": "303835f91b19a500375cb8bd939e2f43",
"assets/FontManifest.json": "212ed8365f9174e6141c1e7603c60834",
"assets/fonts/MaterialIcons-Regular.otf": "d83631b94917157428fc37447cc53d46",
"assets/NOTICES": "8b146cb7ffbe5b9308139a97528a792d",
>>>>>>> af255f5 (Added Daybook screen with transactions and filters)
>>>>>>> e360b6b (Added Daybook screen with transactions and filters)
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/packages/fluttertoast/assets/toastify.js": "56e2c9cedd97f10e7e5f1cebd85d53e3",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"favicon.png": "b1f219191afbfd07e92e38e7419eae81",
"flutter.js": "76f08d47ff9f5715220992f993002504",
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
"flutter_bootstrap.js": "f2cef5dfd9050e26bc1eba62d025c07d",
=======
"flutter_bootstrap.js": "e28bab592990b123faa14f0e0f709146",
>>>>>>> c34ef40 (Added Daybook screen with transactions and filters)
=======
"flutter_bootstrap.js": "1ec315aae479d96dc53862bd8634f16e",
>>>>>>> 4f76ebf (Changed Pin Login screen visibility issue in dark theme.)
=======
"flutter_bootstrap.js": "0b0165dc091642468b7375d924aa2366",
>>>>>>> e8c688b (Added Delete Invoice functionality)
=======
"flutter_bootstrap.js": "4181665edea8077604bcd774ff7b728c",
>>>>>>> d592f14 (Fixed Issues mentioned - 27-5-25)
=======
=======
>>>>>>> d5d32fe (Changed Pin Login screen visibility issue in dark theme.)
"flutter_bootstrap.js": "4181665edea8077604bcd774ff7b728c",
=======
"flutter_bootstrap.js": "e28bab592990b123faa14f0e0f709146",
>>>>>>> af255f5 (Added Daybook screen with transactions and filters)
<<<<<<< HEAD
>>>>>>> e360b6b (Added Daybook screen with transactions and filters)
=======
=======
"flutter_bootstrap.js": "1ec315aae479d96dc53862bd8634f16e",
>>>>>>> 6d16ecd (Changed Pin Login screen visibility issue in dark theme.)
>>>>>>> d5d32fe (Changed Pin Login screen visibility issue in dark theme.)
"icons/Icon-192.png": "b135b553b2009e38a90d4d5d3130c910",
"icons/Icon-512.png": "669b0bca393f76ea8d6d3e8d2620db2a",
"icons/Icon-maskable-192.png": "b135b553b2009e38a90d4d5d3130c910",
"icons/Icon-maskable-512.png": "669b0bca393f76ea8d6d3e8d2620db2a",
"index.html": "3f258a5504b89646b0b79b59e29f6425",
"/": "3f258a5504b89646b0b79b59e29f6425",
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
"main.dart.js": "a9eba739b5c30e41acd469523e98928e",
=======
"main.dart.js": "55d5c8c62c9082bf7c20f8e6cde738cf",
>>>>>>> c34ef40 (Added Daybook screen with transactions and filters)
=======
"main.dart.js": "8bd845a8cb39e43ab6b364fbe3e230cc",
>>>>>>> 4f76ebf (Changed Pin Login screen visibility issue in dark theme.)
=======
"main.dart.js": "d4e3ffe51a35a26a1d73f8f9e83f5a8f",
>>>>>>> e8c688b (Added Delete Invoice functionality)
=======
"main.dart.js": "eab9db75e204e772f6c1f3aaf06b174d",
>>>>>>> d592f14 (Fixed Issues mentioned - 27-5-25)
=======
=======
>>>>>>> d5d32fe (Changed Pin Login screen visibility issue in dark theme.)
"main.dart.js": "eab9db75e204e772f6c1f3aaf06b174d",
=======
"main.dart.js": "55d5c8c62c9082bf7c20f8e6cde738cf",
>>>>>>> af255f5 (Added Daybook screen with transactions and filters)
<<<<<<< HEAD
>>>>>>> e360b6b (Added Daybook screen with transactions and filters)
=======
=======
"main.dart.js": "8bd845a8cb39e43ab6b364fbe3e230cc",
>>>>>>> 6d16ecd (Changed Pin Login screen visibility issue in dark theme.)
>>>>>>> d5d32fe (Changed Pin Login screen visibility issue in dark theme.)
"manifest.json": "bd93dfcba575bb404a932d1adcbf890b",
"splash/img/dark-1x.png": "55b0e00c8641b7744fb086a8ae93fff3",
"splash/img/dark-2x.png": "5676aa73cfbc4189b48c70617af1f581",
"splash/img/dark-3x.png": "018b0195e9aa04c5a43eb3f9006f697c",
"splash/img/dark-4x.png": "d747c3e93d4d124222d7d06ccff13b30",
"splash/img/light-1x.png": "55b0e00c8641b7744fb086a8ae93fff3",
"splash/img/light-2x.png": "5676aa73cfbc4189b48c70617af1f581",
"splash/img/light-3x.png": "018b0195e9aa04c5a43eb3f9006f697c",
"splash/img/light-4x.png": "d747c3e93d4d124222d7d06ccff13b30",
"version.json": "ac2d8a5f479d4b18938018653b02fa5d"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
