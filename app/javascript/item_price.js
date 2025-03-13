const price = () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = `${inputValue * 0.1}`;
  const addProfitDom = document.getElementById("profit");
  addProfitDom.innerHTML = `${inputValue-inputValue * 0.1}`;
  console.log(inputValue);
  })

};
window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);