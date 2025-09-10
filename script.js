function filterProblems() {
    const input = document.getElementById('searchInput').value.toLowerCase();
    const problems = document.querySelectorAll('.problem');

    problems.forEach(problem => {
        const title = problem.querySelector('a').textContent.toLowerCase();
        if (title.includes(input)) {
            problem.style.display = 'flex';
        } else {
            problem.style.display = 'none';
        }
    });
}