

export const index = 2;
let component_cache;
export const component = async () => component_cache ??= (await import('../entries/pages/_page.svelte.js')).default;
export const imports = ["_app/immutable/nodes/2.3fc032b0.js","_app/immutable/chunks/scheduler.b95eede2.js","_app/immutable/chunks/index.564b64db.js"];
export const stylesheets = ["_app/immutable/assets/2.7febba7e.css"];
export const fonts = [];
