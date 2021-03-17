import { csrfParam } from "@rails/ujs";

const attributeRider = () => {
  const btnsRider = document.querySelectorAll('.btn-rider');
  const orderGroups = document.querySelectorAll('.order-group');

  btnsRider.forEach((btnRider) => {
    btnRider.addEventListener('click', (event) => {
      const btnId = event.currentTarget.dataset.btnid;
      let ordersList = "";
      let rider = "";
      orderGroups.forEach((group) => {
        if (group.dataset.groupid == btnId) {
          ordersList = group.dataset.ordersid;
          rider = group.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.value;
        }
      });

      $.ajax({
        type: "POST",
        url: '/delivery_routes',
        data: { ordersList: ordersList, rider: rider }
      });
    });
  });
}

export { attributeRider };