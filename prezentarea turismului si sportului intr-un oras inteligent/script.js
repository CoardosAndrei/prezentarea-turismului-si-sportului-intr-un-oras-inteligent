document.addEventListener("DOMContentLoaded", function() {
    var loginBtns = document.querySelectorAll(".loginBtn");

    loginBtns.forEach(function(btn) {
        btn.addEventListener("click", function() {
            var popup = document.getElementById("popup");
            popup.style.display = "block";
        });
    });

    var closeBtn = document.getElementById("closeBtn");
    if (closeBtn) {
        closeBtn.addEventListener("click", function() {
            var popup = document.getElementById("popup");
            popup.style.display = "none";
        });
    }
});

function navigateTo(page) {
    if (page === 'pagPrinc') {
        window.location.href = 'pagPrinc.html';
    } else {
        window.location.href = page + '.html';
    }
}

function deschidePopup() {
    var popup = document.getElementById("popup");
    popup.style.display = "block";
}
// Adaugă aceste funcții în cadrul secțiunii <script>
var stiri = [
    { titlu: "Prima știre", continut: "Conținutul primei știri." },
    { titlu: "A doua știre", continut: "Conținutul celei de-a doua știri." },
    // Adaugă mai multe știri după același format
];
var indexStireCurenta = 0;

function afiseazaStire(index) {
    var titluStire = document.getElementById("titluStire");
    var continutStire = document.getElementById("continutStire");

    if (index >= 0 && index < stiri.length) {
        titluStire.innerText = stiri[index].titlu;
        continutStire.innerText = stiri[index].continut;
        indexStireCurenta = index;
    }
}

function afiseazaStireAnterioara() {
    afiseazaStire(indexStireCurenta - 1);
}

function afiseazaStireUrmatoare() {
    afiseazaStire(indexStireCurenta + 1);
}

// Afiseaza prima stire initial
afiseazaStire(0);
var stiri = [
    { titlu: "Titlu știre 1", continut: "Conținutul știrii 1." },
    { titlu: "Titlu știre 2", continut: "Conținutul știrii 2." },
    { titlu: "Titlu știre 3", continut: "Conținutul știrii 3." },
    // Adaugă mai multe știri după același format
];
