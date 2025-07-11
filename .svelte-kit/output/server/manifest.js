export const manifest = (() => {
function __memo(fn) {
	let value;
	return () => value ??= (value = fn());
}

return {
	appDir: "_app",
	appPath: "_app",
	assets: new Set(["job_results.json"]),
	mimeTypes: {".json":"application/json"},
	_: {
		client: {"start":"_app/immutable/entry/start.563a8240.js","app":"_app/immutable/entry/app.9d55440d.js","imports":["_app/immutable/entry/start.563a8240.js","_app/immutable/chunks/scheduler.b95eede2.js","_app/immutable/chunks/singletons.3b83fe97.js","_app/immutable/entry/app.9d55440d.js","_app/immutable/chunks/scheduler.b95eede2.js","_app/immutable/chunks/index.564b64db.js"],"stylesheets":[],"fonts":[]},
		nodes: [
			__memo(() => import('./nodes/0.js')),
			__memo(() => import('./nodes/1.js')),
			__memo(() => import('./nodes/2.js'))
		],
		routes: [
			{
				id: "/",
				pattern: /^\/$/,
				params: [],
				page: { layouts: [0,], errors: [1,], leaf: 2 },
				endpoint: null
			}
		],
		matchers: async () => {
			
			return {  };
		}
	}
}
})();
