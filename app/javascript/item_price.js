window.addEventListener('load', function(){
const priceInput = document.getElementById("item-price");
const addTaxDom = document.getElementById('add-tax-price')
const addProfit = document.getElementById('profit')

priceInput.addEventListener("input", () => {
   const inputvalue = priceInput.value;
   const addTaxDom = document.getElementById('add-tax-price')
   addTaxDom.innerHTML = Math.floor(inputvalue * 0.1)
   addProfit.innerHTML = Math.floor(inputvalue - Math.round(priceInput.value * 0.1))
})
})
