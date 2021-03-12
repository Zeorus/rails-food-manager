import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'product' ];

  add() {
    const priceField = document.getElementById('total-price-field');
    const orderPriceInput = document.getElementById('order_total_price');
    const price = parseFloat(priceField.innerText);
    const productList = document.getElementById('order-product-list');
    const poductId = parseFloat(this.productTarget.dataset.product_id);
    const productName = this.productTarget.dataset.product_name;
    const productPrice = this.productTarget.dataset.product_price;
    if (document.getElementById(`product-${poductId}`)) {
      const inputField = document.getElementById(`input-product-${poductId}`);
      inputField.value = parseInt(inputField.value, 10) + 1;
      priceField.innerText = (price + parseFloat(productPrice)).toFixed(2);
      orderPriceInput.value = parseFloat(priceField.innerText).toFixed(2);
    } else {
      const insertProduct = `<li id="product-${poductId}">${productName}<span class="flex-grow-1"></span>${productPrice}<i class="fas fa-euro-sign"></i><input name="products[${poductId}]" value="1" id="input-product-${poductId}"><i class="far fa-trash-alt" data-id="product-${poductId}"></i></li>`;
      productList.insertAdjacentHTML('beforeend', insertProduct);
      priceField.innerText = (price + parseFloat(productPrice)).toFixed(2);
      orderPriceInput.value = parseFloat(priceField.innerText).toFixed(2);
      document.getElementById(`input-product-${poductId}`).addEventListener('focus', (event) => {
        const originValue = document.getElementById(`input-product-${poductId}`).value;
        document.getElementById(`input-product-${poductId}`).onchange = () => {
          const currentValue = document.getElementById(`input-product-${poductId}`).value;
          priceField.innerText = (parseFloat(priceField.innerText) + (parseInt(currentValue, 10) - parseInt(originValue, 10)) * parseFloat(productPrice)).toFixed(2);
          orderPriceInput.value = parseFloat(priceField.innerText).toFixed(2);
        }
      });
      document.querySelector(`[data-id="product-${poductId}"]`).addEventListener('click', (event) => {
        priceField.innerText = (parseFloat(priceField.innerText) - (parseFloat(productPrice) * parseInt(document.getElementById(`input-product-${poductId}`).value, 10))).toFixed(2);
        orderPriceInput.value = parseFloat(priceField.innerText).toFixed(2);
        document.getElementById(`product-${poductId}`).parentNode.removeChild(document.getElementById(`product-${poductId}`));
      });
    }
  }
}
