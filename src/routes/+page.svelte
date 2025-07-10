<script lang="ts">
  import { onMount } from 'svelte';
  import { fetchJobs } from '$lib/api';

  let jobs: any[] = [];
  let loading = true;

  onMount(async () => {
    jobs = await fetchJobs();
    loading = false;
  });
</script>

<svelte:head>
  <title>Job Rotator UI</title>
</svelte:head>

<main>
  <h1>🌀 Job Rotator</h1>
  {#if loading}
    <p>Loading jobs...</p>
  {:else if jobs.length === 0}
    <p>No jobs found.</p>
  {:else}
    <ul>
      {#each jobs as job}
        <li>
          <strong>{job.position}</strong> @ {job.company}<br />
          <a href={job.url} target="_blank">{job.url}</a>
        </li>
      {/each}
    </ul>
  {/if}
</main>

<style>
  main {
    max-width: 700px;
    margin: 2rem auto;
    padding: 1rem;
    font-family: system-ui, sans-serif;
    background: #111;
    color: #eee;
    border-radius: 12px;
  }

  a {
    color: #00bfff;
    text-decoration: none;
  }

  h1 {
    font-size: 2rem;
    margin-bottom: 1rem;
  }

  li {
    margin-bottom: 1rem;
    border-bottom: 1px solid #333;
    padding-bottom: 0.5rem;
  }
</style>
