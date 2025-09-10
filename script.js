// Select all buttons inside .filters .tags (excluding the Remove All button)
const buttons = document.querySelectorAll(".filters .tags button:not(#clearFilters)");

// Restore state and add toggle functionality
buttons.forEach((btn, index) => {
  const storageKey = `tagButton_${index}`;

  // Restore state from localStorage
  if (localStorage.getItem(storageKey) === "true") {
    btn.classList.add("active");
  }

  // Toggle on click
  btn.addEventListener("click", () => {
    btn.classList.toggle("active");
    localStorage.setItem(storageKey, btn.classList.contains("active"));
  });
});

// "Remove All Filters" button
const clearBtn = document.getElementById("clearFilters");

clearBtn.addEventListener("click", () => {
  buttons.forEach((btn, index) => {
    btn.classList.remove("active");                       // remove active class
    localStorage.setItem(`tagButton_${index}`, false);    // clear localStorage
  });
<<<<<<< HEAD
});
=======
});
>>>>>>> 483d8621df3da13c7cfe0a5a90b9c75852f64a87
