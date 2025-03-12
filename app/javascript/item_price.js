const price = () => {
  const priceInput = document.getElementById("item-price");
  if (!priceInput) return;  // priceInput が取得できない場合に関数の実行を停止

  priceInput.addEventListener("input", () => {
    const inputValue = parseFloat(priceInput.value) || 0;  // 文字列を数値に変換、空文字の場合の対策
    const addTaxDom = document.getElementById("add-tax-price");
    if (addTaxDom) addTaxDom.innerHTML = `${(inputValue * 0.1).toFixed(0)}`; // 小数点以下0桁に固定

    const addProfitDom = document.getElementById("profit");
    if (addProfitDom) addProfitDom.innerHTML = `${(inputValue - inputValue * 0.1).toFixed(0)}`; // 小数点以下0桁に固定

    console.log(inputValue);
  });
};

document.addEventListener("DOMContentLoaded", price);
window.addEventListener("turbo:load", price);