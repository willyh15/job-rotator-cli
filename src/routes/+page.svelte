<script lang="ts">
	import { onMount } from 'svelte';
	import type { JobEntry } from '$lib/types';

	let jobs: JobEntry[] = [];
	let search = '';
	let category = 'All';

	const categories = ['All', 'Fullstack', 'Frontend', 'Backend', 'DevOps', 'Cybersecurity', 'AI', 'Pen Testing'];

	onMount(async () => {
		const res = await fetch('/job_results.json');
		jobs = await res.json();
	});

	$: filtered = jobs.filter(job => {
		const matchSearch = job.title.toLowerCase().includes(search.toLowerCase());
		const matchCategory =
			category === 'All' || job.title.toLowerCase().includes(category.toLowerCase());
		return matchSearch && matchCategory;
	});
</script>

<style>
	.container {
		max-width: 720px;
		margin: 2rem auto;
		padding: 1rem;
		font-family: system-ui;
	}
	input, select {
		margin-right: 1rem;
		padding: 0.5rem;
		font-size: 1rem;
	}
	a {
		display: block;
		margin: 1rem 0;
		font-weight: bold;
		color: #3c82f6;
		text-decoration: none;
	}
	a:hover {
		text-decoration: underline;
	}
</style>

<div class="container">
	<h1>💼 Job Rotator Results</h1>

	<div style="margin: 1rem 0;">
		<input type="text" placeholder="Search..." bind:value={search} />
		<select bind:value={category}>
			{#each categories as cat}
				<option value={cat}>{cat}</option>
			{/each}
		</select>
	</div>

	{#if filtered.length === 0}
		<p>No results found.</p>
	{:else}
		{#each filtered as job}
			<a href={job.url} target="_blank" rel="noopener noreferrer">
				{job.title}
			</a>
		{/each}
	{/if}
</div>