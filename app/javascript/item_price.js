window.addEventListener('load', () => {
  
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price")
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));

    const profitValue = document.getElementById("profit")
    const addTaxValue=(Math.floor(inputValue * 0.1));
    addTaxDom.innerHTML = addTaxValue;
    profitValue.innerHTML = (Math.floor(inputValue - addTaxValue));
  });
});
