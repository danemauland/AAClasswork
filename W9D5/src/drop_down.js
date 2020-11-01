
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

const dogLinkCreator = pojo => {
  const lis = [];
  for (let dog in pojo) {
    const link = pojo[dog];
    const li = document.createElement("li");
    const a = document.createElement("a");
    a.innerHTML = dog;
    a.href = link;
    li.classList.add("dog-link");
    li.classList.add("hidden");
    li.append(a);
    lis.push(li);
  }
  return lis;
}

const attachDogLinks = () => {
  dogLinks = dogLinkCreator(dogs);
  const ul = document.getElementsByClassName("drop-down-dog-list")[0];
  dogLinks.forEach( li => {
    ul.append(li);
  })
}

const handleEnter = () => {
  const lis = document.querySelectorAll(".dog-link");
  lis.forEach( li => {
    li.classList.remove("hidden");
  });
}

const handleLeave = () => {
  const lis = document.querySelectorAll(".dog-link");
  lis.forEach(li => {
    li.classList.add("hidden");
  });
}

attachDogLinks();

const nav = document.getElementsByClassName("drop-down-dog-nav")[0];
nav.addEventListener("mouseenter", handleEnter);
nav.addEventListener("mouseleave", handleLeave);