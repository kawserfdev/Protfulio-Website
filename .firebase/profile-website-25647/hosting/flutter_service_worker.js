'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"assets/AssetManifest.bin.json": "1cbe33947118cfb222c91a1dda23e2af",
"assets/fonts/MaterialIcons-Regular.otf": "0a59fa6729e9d98fd63872d0ddb79aa0",
"assets/assets/images/twitter.png": "b2e7877638211e368412bedef511aca9",
"assets/assets/images/me.jpg": "a13e388703c3f81c4d3d1ca1ccd7a15b",
"assets/assets/images/grow_up.jpg": "e7a7d411f72b269e88bb43beb2b200ae",
"assets/assets/images/venue_finder_logo.jpg": "1c29eb701126283f8d6451e6116a5f32",
"assets/assets/images/UX-App-design.jpg": "c5dd9e587c9d7e390bcf92c12e838121",
"assets/assets/images/background.jpg": "1da8d05be84f8d485af84a2226d82a53",
"assets/assets/images/cooding.jpg": "1bd38a237017e3dfdd0665bbeb7bb8d8",
"assets/assets/images/github.png": "45a2df65892e2884bef414c6eddaac86",
"assets/assets/images/facebook.png": "abc4da3eae28f830867542e37cfe09d2",
"assets/assets/images/email.png": "961928491ef8009b6515f47b9bf578dc",
"assets/assets/images/kawser.jpg": "afdb33378d97da9cdb242d657baf6512",
"assets/assets/images/experence.png": "18c629704628d5c013a8baa511acfa53",
"assets/assets/images/coffee.jpg": "f5dc7b3b5e634ddcda297b624101989e",
"assets/assets/images/site.png": "c4f0e797b7f7b5c920ce9c29703c6904",
"assets/assets/images/phone.png": "d384a80ba2833afff4639b7bbf2f72c0",
"assets/assets/images/happy_clint.png": "f65c2f8d24421508dfeee7f415120a4e",
"assets/assets/images/cover.jpg": "037889c199ac374875bbe597c9c0a1fd",
"assets/assets/images/linkedin.png": "f0ff36db7d3f73d439515c3de37892e8",
"assets/assets/images/info.png": "67b669f2942c06a0e026df78624d7462",
"assets/assets/images/complete_order.png": "52d859ebe9a58352629522e9b3cca5eb",
"assets/assets/images/panning.jpg": "febb73ee6555a09f67ab9b9393b8dbd3",
"assets/assets/images/successful.jpg": "2724b7a5b775e8ed04aa7d8f3503af43",
"assets/assets/images/coffe.png": "ad3665fc595a9ec2fb0bfd1ea3814f75",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/FontManifest.json": "b417c8197e08be3f18101f9b01bf0e45",
"assets/NOTICES": "091d10a095ec8507dfea3cd543781c57",
"assets/packages/fluent_ui/fonts/FluentIcons.ttf": "b6530f23d5df9d8b334e31a4dc62e0d0",
"assets/packages/fluent_ui/assets/AcrylicNoise.png": "81f27726c45346351eca125bd062e9a7",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/AssetManifest.json": "6e7ea5097cc3d7e8c43851eb3ff407c2",
"assets/AssetManifest.bin": "30d280527ee898a3478541b037895123",
"manifest.json": "a8f11cec21e9634cb2e36316ec51f005",
"main.dart.js": "f28f65e64010556d58f2db4cc19cfda7",
"index.html": "c8e2bc21f460cceb2254b0420b61952f",
"/": "c8e2bc21f460cceb2254b0420b61952f",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"version.json": "ed4196a263a7919322bbf877a1c4ca63",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"flutter_bootstrap.js": "40a077cbb845f368285b258104c36b4c"};
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
