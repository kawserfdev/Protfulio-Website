'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "cfa9759fafaf490e0b597f7bb7aaca06",
"version.json": "ed4196a263a7919322bbf877a1c4ca63",
"index.html": "abc683a3f77507f5855ce3f4f3455cd7",
"/": "abc683a3f77507f5855ce3f4f3455cd7",
"main.dart.js": "771e79542a45d32b0b46af9cf980fdab",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "a8f11cec21e9634cb2e36316ec51f005",
"assets/images/me.jpg": "a13e388703c3f81c4d3d1ca1ccd7a15b",
"assets/images/info.png": "67b669f2942c06a0e026df78624d7462",
"assets/images/email.png": "961928491ef8009b6515f47b9bf578dc",
"assets/images/coffee.jpg": "f5dc7b3b5e634ddcda297b624101989e",
"assets/images/happy_clint.png": "f65c2f8d24421508dfeee7f415120a4e",
"assets/images/kawser.jpg": "afdb33378d97da9cdb242d657baf6512",
"assets/images/github.png": "45a2df65892e2884bef414c6eddaac86",
"assets/images/UX-App-design.jpg": "c5dd9e587c9d7e390bcf92c12e838121",
"assets/images/complete_order.png": "52d859ebe9a58352629522e9b3cca5eb",
"assets/images/panning.jpg": "febb73ee6555a09f67ab9b9393b8dbd3",
"assets/images/grow_up.jpg": "e7a7d411f72b269e88bb43beb2b200ae",
"assets/images/background.jpg": "1da8d05be84f8d485af84a2226d82a53",
"assets/images/twitter.png": "b2e7877638211e368412bedef511aca9",
"assets/images/linkedin.png": "f0ff36db7d3f73d439515c3de37892e8",
"assets/images/cover.jpg": "037889c199ac374875bbe597c9c0a1fd",
"assets/images/phone.png": "d384a80ba2833afff4639b7bbf2f72c0",
"assets/images/coffe.png": "ad3665fc595a9ec2fb0bfd1ea3814f75",
"assets/images/successful.jpg": "2724b7a5b775e8ed04aa7d8f3503af43",
"assets/images/facebook.png": "abc4da3eae28f830867542e37cfe09d2",
"assets/images/experence.png": "18c629704628d5c013a8baa511acfa53",
"assets/images/venue_finder_logo.jpg": "1c29eb701126283f8d6451e6116a5f32",
"assets/images/site.png": "c4f0e797b7f7b5c920ce9c29703c6904",
"assets/images/cooding.jpg": "1bd38a237017e3dfdd0665bbeb7bb8d8",
"assets/projects/fodei.jpg": "3e2966a6ba08508d0ff023bb417c602e",
"assets/projects/Sutraq.jpg": "5df5a13c499a41c691453ead142efd61",
"assets/projects/learning-campus.jpg": "4f8af36501ceed2184334a59d42cf9bd",
"assets/projects/Shelter-Travel.jpg": "4a98e98b1216486f8e2c1eb9d7e643ad",
"assets/projects/Peer-Vendors.jpg": "fd53626fd58d328141fde4177189c604",
"assets/projects/venue-finder.png": "3f1ac82fa6fe90de95ef31c5c6bda344",
"assets/projects/fitness.jpg": "3f612d40af8c416c61533791d4eba18c",
"assets/projects/glamuare.png": "b969d0c6d1cfc38f4fc3dbd04077ad90",
"assets/projects/shpper.png": "a8c5f7104c5d2e18fcbb58a042845d71",
"assets/AssetManifest.json": "4581efc03499eabf775dfa3cee6b6452",
"assets/NOTICES": "0c3b3f51224e4c050875545acf600a64",
"assets/FontManifest.json": "1c5b8d11958192bd5e761fc47a368d8c",
"assets/AssetManifest.bin.json": "ac8907f7d6243d0e994c433409bdb3ed",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/remixicon/fonts/Remix.ttf": "94d7137d8d7f18dd64ce1b2a92e7abd9",
"assets/packages/fluent_ui/fonts/FluentIcons.ttf": "b6530f23d5df9d8b334e31a4dc62e0d0",
"assets/packages/fluent_ui/assets/AcrylicNoise.png": "81f27726c45346351eca125bd062e9a7",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/skills/python.png": "6606c48fbf49fc629449aa11170b8c1c",
"assets/skills/flutter.png": "83e0b762778417141075bba73510d371",
"assets/skills/github.png": "357c3c73e054d6b0eb9a10dbf80aca08",
"assets/skills/firebase.png": "0e8789d152ed2744d7f7265dc3f1457e",
"assets/skills/gitlab.png": "a49463bd631947713d53c694a8aa12a2",
"assets/skills/html.png": "945d8320b2991e7345ea0dda5ee1b6bb",
"assets/skills/c++.png": "e4f46516b8d0d4b45f958b7e404f2d55",
"assets/skills/c.png": "311ee4e8dcfc7062d9fa695fcc4777a0",
"assets/skills/getx.png": "cb152befc8070517aeb4378fa585c2e0",
"assets/skills/riverpod.png": "355e49f03a33851e317690630b30131b",
"assets/skills/dart.png": "a675cb93b75d5f1656c920dceecdcb38",
"assets/AssetManifest.bin": "00cb5ffc915b3efd065880f15fb5f8e4",
"assets/fonts/MaterialIcons-Regular.otf": "bae2ca11d333cbfbd0b01bcd73c2ae91",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
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
