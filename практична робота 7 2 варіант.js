document.addEventListener("DOMContentLoaded", () => {
    const body = document.body, root = document.documentElement;
    const theme = localStorage.getItem("theme") || "light";
    const bg = localStorage.getItem("bg"), text = localStorage.getItem("text");

    if (bg) root.style.setProperty("--bg", bg);
    if (text) root.style.setProperty("--text", text);
    body.className = theme;

    function setTheme(t) {
        body.className = t;
        localStorage.setItem("theme", t);
    }

    function saveColors() {
        let bg = document.getElementById("bg").value;
        let text = document.getElementById("text").value;
        root.style.setProperty("--bg", bg);
        root.style.setProperty("--text", text);
        localStorage.setItem("bg", bg);
        localStorage.setItem("text", text);
        setTheme("custom");
    }

    document.querySelectorAll("button").forEach(btn => {
        btn.addEventListener("click", () => setTheme(btn.textContent.toLowerCase()));
    });

    document.querySelector("button:last-of-type").addEventListener("click", saveColors);
});