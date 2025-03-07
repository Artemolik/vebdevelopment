let time = 0, timer;

function start() {
    if (!time) time = +document.getElementById("inputTime").value || 0;
    clearInterval(timer);
    timer = setInterval(() => {
        if (time > 0) { time--; show(); } 
        else { clearInterval(timer); alert("Час вийшов!"); }
    }, 1000);
}

function pause() { clearInterval(timer); }

function adjust(sec) { time = Math.max(0, time + sec); show(); }

function show() { 
    let m = Math.floor(time / 60), s = time % 60;
    document.getElementById("timer").innerText = ${m}:${s.toString().padStart(2, '0')};
}