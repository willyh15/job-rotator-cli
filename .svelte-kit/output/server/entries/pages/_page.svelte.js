import { c as create_ssr_component, d as add_attribute, f as each, e as escape } from "../../chunks/ssr.js";
const _page_svelte_svelte_type_style_lang = "";
const css = {
  code: ".container.svelte-1whe15v{max-width:720px;margin:2rem auto;padding:1rem;font-family:system-ui}input.svelte-1whe15v,select.svelte-1whe15v{margin-right:1rem;padding:0.5rem;font-size:1rem}a.svelte-1whe15v{display:block;margin:1rem 0;font-weight:bold;color:#3c82f6;text-decoration:none}a.svelte-1whe15v:hover{text-decoration:underline}",
  map: null
};
const Page = create_ssr_component(($$result, $$props, $$bindings, slots) => {
  let filtered;
  let jobs = [];
  let search = "";
  let category = "All";
  const categories = [
    "All",
    "Fullstack",
    "Frontend",
    "Backend",
    "DevOps",
    "Cybersecurity",
    "AI",
    "Pen Testing"
  ];
  $$result.css.add(css);
  filtered = jobs.filter((job) => {
    const matchSearch = job.title.toLowerCase().includes(search.toLowerCase());
    const matchCategory = category === "All";
    return matchSearch && matchCategory;
  });
  return `<div class="container svelte-1whe15v"><h1 data-svelte-h="svelte-15hmrkd">💼 Job Rotator Results</h1> <div style="margin: 1rem 0;"><input type="text" placeholder="Search..." class="svelte-1whe15v"${add_attribute("value", search, 0)}> <select class="svelte-1whe15v">${each(categories, (cat) => {
    return `<option${add_attribute("value", cat, 0)}>${escape(cat)}</option>`;
  })}</select></div> ${filtered.length === 0 ? `<p data-svelte-h="svelte-1pifa0h">No results found.</p>` : `${each(filtered, (job) => {
    return `<a${add_attribute("href", job.url, 0)} target="_blank" rel="noopener noreferrer" class="svelte-1whe15v">${escape(job.title)} </a>`;
  })}`}</div>`;
});
export {
  Page as default
};
