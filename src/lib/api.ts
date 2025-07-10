export async function fetchJobs(): Promise<any[]> {
  const res = await fetch('/job_results.json');
  if (!res.ok) throw new Error('Failed to load jobs');
  return res.json();
}