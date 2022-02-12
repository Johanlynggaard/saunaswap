
const asc = () => {
  let btn = document.getElementById("ascending");
  btn.addEventListener("click", (event) => {
    const elements = document.querySelectorAll(".card-trip");
    const cards = document.querySelector("#content > div.row > div.col-md-4 > div.cards.container");
    let array = Array.from(elements)
    let y = array.sort(function (a, b) { return a.dataset.price - b.dataset.price });
    cards.innerHTML = ""
    array.forEach((element) => {
      cards.appendChild(element)
    });
  });
};


const desc = () => {
  let btn = document.getElementById("descending");
  btn.addEventListener("click", (event) => {
    const elements = document.querySelectorAll(".card-trip");
    const cards = document.querySelector("#content > div.row > div.col-md-4 > div.cards.container");
    let array = Array.from(elements)
    let y = array.sort(function (a, b) { return b.dataset.price - a.dataset.price });
    cards.innerHTML = ""
    array.forEach((element) => {
      cards.appendChild(element)
    });
  });
};

export { asc };
export { desc };
