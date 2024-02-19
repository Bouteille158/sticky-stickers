self.addEventListener("install", (event) => {
	event.waitUntil(
		fetch("./cached-files-list.txt")
			.then((response) => response.text())
			.then((listsList) => {
				const fileList = listsList.split("\n");
				var urlsToCache = [
					"./",
					"./index.html",
					"./style.css",
					"./lists-list.txt",
					"./manifest.json",
					"./icon.png",
					"./favicon.ico",
					"./cached-files-list.txt",
				];
				console.table(urlsToCache);
				fileList.forEach((file) => {
					urlsToCache.push(file);
				});
				console.table(urlsToCache);
				return caches.open("v1").then((cache) => {
					console.log("Opened cache");
					// Uncaught (in promise) TypeError: Failed to execute 'addAll' on 'Cache': Request failed

					let cachePromises = urlsToCache.map((url) =>
						cache
							.add(url)
							.catch((error) =>
								console.error(`Failed to cache ${url}: `, error)
							)
					);

					return Promise.all(cachePromises);
				});
			})
	);
});

self.addEventListener("fetch", (event) => {
	event.respondWith(
		caches.match(event.request).then((response) => {
			return response || fetch(event.request);
		})
	);
});
