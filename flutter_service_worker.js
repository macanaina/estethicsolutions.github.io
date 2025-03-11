'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "e6a991f6e1603d526efac36a9871ab90",
"version.json": "2250fd34c9494d74736e89ec1423436d",
"index.html": "043571e872c1ddca50fa24ade2ea5ef7",
"/": "043571e872c1ddca50fa24ade2ea5ef7",
"main.dart.js": "7bb92e0b13bc00b8fe9f86a5d8f3b7dc",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "3adba2c977e238f0be3614031707d3d6",
"assets/AssetManifest.json": "ce377a285a4aec52cc15541c8f6d5aa9",
"assets/NOTICES": "43e4b48af476a96ceb819d6555f2e647",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/AssetManifest.bin.json": "bbf4c3dcf889b64f863350e21cbf2abd",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "af0c1209e2f8885de19811eacb6278fa",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "3ca5dc7621921b901d513cc1ce23788c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "00a0d5a58ed34a52b40eb372392a8b98",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "f3d9426227c73187e1c02b89b6c7ad96",
"assets/fonts/MaterialIcons-Regular.otf": "dc9670a262729805af3070bd178d82dc",
"assets/assets/images/emt1+/8.jpg": "7e1d870399baa4c0a92cd72392ffa588",
"assets/assets/images/emt1+/9.jpg": "628de837c773eb45fe90decb51c8a4d8",
"assets/assets/images/emt1+/12.jpg": "5fe65bd6c2e8ce58d4a4942872df6436",
"assets/assets/images/emt1+/11.jpg": "b91306cdb81a322c35d8d0870bad04d4",
"assets/assets/images/emt1+/10.jpg": "c9a5c6b6ed08c79f68013f385a0edc55",
"assets/assets/images/emt1+/4.jpg": "6424f4fd6dd81dd306d4bc63241c3b94",
"assets/assets/images/emt1+/5.jpg": "8d12bbee25dea49dcbd75a5e09c0b5d4",
"assets/assets/images/emt1+/7.jpg": "f3d456395dc783f748faad1d47aa1c93",
"assets/assets/images/emt1+/6.jpg": "42d64c133484c1c96d0a30a1aa3d1280",
"assets/assets/images/emt1+/2.jpg": "97a8619da71bd72a3a9433d11cf4214e",
"assets/assets/images/emt1+/3.jpg": "3af83df1110be96f7fdd849f7ca25b1b",
"assets/assets/images/emt1+/1.jpg": "4be8fde2de3d7887099f268305a188fa",
"assets/assets/images/hifu_22d/8.jpg": "7655037f48c39faf1a989aaccb102fb2",
"assets/assets/images/hifu_22d/4.jpg": "b6eee0d3b69aa80a702fa552963d67af",
"assets/assets/images/hifu_22d/5.jpg": "6588f9480c7b768b2be36057155f9753",
"assets/assets/images/hifu_22d/7.jpg": "8dcbdc714760d66347ebaee82127e28b",
"assets/assets/images/hifu_22d/6.jpg": "386d65a8ed1a7979f2999c6d00b0117c",
"assets/assets/images/hifu_22d/2.jpg": "3b8ba0d1e462d608d272e5f2194387d6",
"assets/assets/images/hifu_22d/3.jpg": "8c66a80a95a7d8811be6f9909ce34e5b",
"assets/assets/images/hifu_22d/1.jpg": "1d018f264337c09f0743771adf5cee08",
"assets/assets/images/emt1/8.jpg": "f2e47b9fc020e12a9f15d6f64698c606",
"assets/assets/images/emt1/9.jpg": "90165b33ce9e15289431b1a276ecae62",
"assets/assets/images/emt1/4.jpg": "bb7d8646a8f6885e958d224cfdcedafd",
"assets/assets/images/emt1/5.jpg": "0a997d0a35f1d4acc12801380778bee3",
"assets/assets/images/emt1/7.jpg": "7e1d870399baa4c0a92cd72392ffa588",
"assets/assets/images/emt1/6.jpg": "42491782aa42e0546382a815556f6d85",
"assets/assets/images/emt1/2.jpg": "db3a023915911533760873d5d7d1ffce",
"assets/assets/images/emt1/3.jpg": "02b9629fbd2876bbb13556193faee4a4",
"assets/assets/images/emt1/1.jpg": "ab7889346bd3098cc909eab0d605a19b",
"assets/assets/images/hifu_12/4.jpg": "51f8e7b16b3331a393a15419cb3f0b12",
"assets/assets/images/hifu_12/5.jpg": "bcb0c55edd13fa1a9d0ef12f0e36a930",
"assets/assets/images/hifu_12/6.jpg": "04de29a0b2745d68525e028214fbb019",
"assets/assets/images/hifu_12/2.jpg": "8e029f6f7af486c7adf7dc24b522e47e",
"assets/assets/images/hifu_12/3.jpg": "a3325a25930c06e93f539346a7172dee",
"assets/assets/images/hifu_12/1.jpg": "405a1c392670bfbda9157e01dee61b4a",
"assets/assets/images/hifu_12d_max/4.jpg": "7e47d939e4748b7ad89e6358a298169a",
"assets/assets/images/hifu_12d_max/5.jpg": "850ad64536b93ba21dc5a84f9f81f470",
"assets/assets/images/hifu_12d_max/7.jpg": "d7f37cf3d3a56f6fcd0d82613d3b09a8",
"assets/assets/images/hifu_12d_max/6.jpg": "2f67b03e1c8d8723fd8855554fec56eb",
"assets/assets/images/hifu_12d_max/2.jpg": "be63759afad240b3e7743df67c1a8210",
"assets/assets/images/hifu_12d_max/3.jpg": "ec698effb727cdb508ef12c288de17a5",
"assets/assets/images/hifu_12d_max/1.jpg": "33a2df7e683b45535c8000b6020cb30f",
"assets/assets/images/qm_650/4.jpg": "2f58bc99bc8499d2f8352f92fc31d0cd",
"assets/assets/images/qm_650/5.jpg": "342cf10a0060fa53965de0674934eae8",
"assets/assets/images/qm_650/2.jpg": "f57ea6a7546ed44011e8f0e1624bad2d",
"assets/assets/images/qm_650/3.jpg": "72de170f32112fe4f713e33acda22288",
"assets/assets/images/qm_650/1.jpg": "11a504e244e9f887cc88947bf8c33abc",
"assets/assets/images/dr_pen/4.jpg": "db141090ac3a51bb4f90293edd9f82a5",
"assets/assets/images/dr_pen/5.jpg": "8ef06e78dec3eb09bf7306dd50b0a322",
"assets/assets/images/dr_pen/2.jpg": "64693fcd7496aa0f23b763eba81b2b96",
"assets/assets/images/dr_pen/3.jpg": "7f48832a9616a55a3cb26c00675cebc3",
"assets/assets/images/dr_pen/1.jpg": "5caca5281baa80cbd3eb462649a31a61",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.js": "ba4a8ae1a65ff3ad81c6818fd47e348b",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/canvaskit.js": "6cfe36b4647fbfa15683e09e7dd366bc",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206"};
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
