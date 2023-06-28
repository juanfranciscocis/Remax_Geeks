'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "0b8793b0ee5743ba1479e848907bb2b8",
"index.html": "95665169805570746dae9f3003bbcafc",
"/": "95665169805570746dae9f3003bbcafc",
"main.dart.js": "f3710deacb5ad257eadab2f40530c0dc",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"favicon.png": "8fdea014f6f7d9e4ea99c9514f2ca095",
"main-icon.png": "e0d621965da8d2baa06195ff92a3da09",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "3d23570c7379c24d965a7992918544f8",
"assets/AssetManifest.json": "ad8bf9fe1ae66bcdc6133dd398e8194a",
"assets/NOTICES": "e1823390f52167dec1c5338b87d579bb",
"assets/FontManifest.json": "cdceaf2d4a83ca2d108ab30b30316f27",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"assets/packages/flutter_google_places_sdk_platform_interface/assets/google/1.5x/powered_by_google_on_non_white.png": "a0bdd851f1d00d131f005c60ed2cb16b",
"assets/packages/flutter_google_places_sdk_platform_interface/assets/google/1.5x/powered_by_google_on_white.png": "c7e713340ff7ad9e1af8482ad2a71349",
"assets/packages/flutter_google_places_sdk_platform_interface/assets/google/2.0x/powered_by_google_on_non_white.png": "e72d1907bf5d0f6c1153e50aa7cf7f9a",
"assets/packages/flutter_google_places_sdk_platform_interface/assets/google/2.0x/powered_by_google_on_white.png": "60e8a8323a1f5c9dc59c6783d5974123",
"assets/packages/flutter_google_places_sdk_platform_interface/assets/google/powered_by_google_on_non_white.png": "27efb6d97555008ec637e8c5a6833f82",
"assets/packages/flutter_google_places_sdk_platform_interface/assets/google/3.0x/powered_by_google_on_non_white.png": "97f2acfb6e993a0c4134d9d04dff21e2",
"assets/packages/flutter_google_places_sdk_platform_interface/assets/google/3.0x/powered_by_google_on_white.png": "40bc3ae5444eae0b9228d83bfd865158",
"assets/packages/flutter_google_places_sdk_platform_interface/assets/google/4.0x/powered_by_google_on_non_white.png": "33ff537622b33a8a161646a7be0800d0",
"assets/packages/flutter_google_places_sdk_platform_interface/assets/google/4.0x/powered_by_google_on_white.png": "cbb17d77d4436ba71593febe71599b53",
"assets/packages/flutter_google_places_sdk_platform_interface/assets/google/0.75x/powered_by_google_on_non_white.png": "78b06d238cb55fd775d0faefc44448f7",
"assets/packages/flutter_google_places_sdk_platform_interface/assets/google/0.75x/powered_by_google_on_white.png": "31bc81278fd5b781b342ea1e767d032e",
"assets/packages/flutter_google_places_sdk_platform_interface/assets/google/powered_by_google_on_white.png": "f127e368d62ad92dacab340de5af50e8",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.bin": "4f637258163d370edbf3c06433d6b0ad",
"assets/fonts/Outfit-Bold.ttf": "e28d1b405645dfd47f4ccbd97507413c",
"assets/fonts/Outfit-Regular.ttf": "9f444021dd670d995f9341982c396a1d",
"assets/fonts/Outfit-Medium.ttf": "3c88ad79f2a55beb1ffa8f68d03321e3",
"assets/fonts/MaterialIcons-Regular.otf": "62ec8220af1fb03e1c20cfa38781e17e",
"assets/assets/confirm.png": "370474ba2e788c357b4b43dcf61c9f21",
"assets/assets/signIn/google.png": "3e26049d9396f49912688a986b4027b8",
"assets/assets/signIn/facebook.png": "a81177d3822dc3b646b8b4c3b5db6bd1",
"assets/assets/landingPage/landingPageHouse.png": "2d7dc18e4118d47416c2f9e55601b16f",
"assets/assets/landingPage/burgerMenu.png": "45245b6e9556cd06d06e8f91ea8bca14",
"assets/assets/landingPage/logo.png": "e864af1dae51ffbae0c12eb63b0636ae",
"assets/assets/services/zillow.png": "5d1950ec54ea18f4fa962446c2ee1e3e",
"assets/assets/services/rm.png": "ecc3546658748f39bfc8bcbf1790c780",
"assets/assets/services/americanRealState.png": "03bfe98e74e07e9c5fbe3e40827622ed",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
