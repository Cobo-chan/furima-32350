function price() {
  const priceText = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  priceText.addEventListener('keyup', function(){
    const taxPrice = Math.floor(priceText.value * 0.1);
    const profitPrice = Math.floor(priceText.value - taxPrice);
    addTaxPrice.innerHTML = taxPrice.toLocaleString();
    profit.innerHTML = profitPrice.toLocaleString();
  });

};
window.addEventListener('load', price)