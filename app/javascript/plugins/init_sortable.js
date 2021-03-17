import Sortable from 'sortablejs';

const initSortable = () => {
  const nestedSortables = document.querySelectorAll('.order-list')

  for (var i = 0; i < nestedSortables.length; i++) {
    new Sortable(nestedSortables[i], {
      group: 'nested',
      ghostClass: "ghost",
      animation: 150,
      fallbackOnBody: false,
      swapThreshold: 0.65
    });
  }

  const orderItems = document.querySelectorAll('.list-order-item');
  const orderGroups = document.querySelectorAll('.order-group');

  // A l'initialisation, on ajoute en dataset les IDs des orders pour les groupes
  orderGroups.forEach((group) => {
    const insertDataOrderId = [];
    for (let i = 0; i < group.children[1].childElementCount; i += 1) {
      const orderId = group.children[1].children[i].dataset.orderid;
      insertDataOrderId.push(orderId);
    }
    group.dataset.ordersid = insertDataOrderId;
  });

  // A chaque drag&drop, on réajuste les IDs des orders des groupes
  orderItems.forEach((orderItem) => {
    orderItem.addEventListener('drop', (event) => {
      orderGroups.forEach((group) => {
        const insertDataOrderId = [];
        for (let i = 0; i < group.children[1].childElementCount; i += 1) {
          const orderId = group.children[1].children[i].dataset.orderid;
          insertDataOrderId.push(orderId);
        }
        group.dataset.ordersid = insertDataOrderId;
      });
      
      // On change la couleur du marqueur en fonction du groupe où on drop l'order
      const marker = document.getElementById(`marker-${event.currentTarget.dataset.customerid}`);
      const dropInGroup = event.currentTarget.parentNode.parentNode.dataset.groupid;
      if (dropInGroup == "1") {
        marker.style.fill="blue";
      } else if (dropInGroup == "2") {
        marker.style.fill="red";
      } else if (dropInGroup == "3") {
        marker.style.fill="green";
      } else {
        marker.style.fill="yellow";
      }
    });
  });
};

export { initSortable };
