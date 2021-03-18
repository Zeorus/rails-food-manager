// Plugin pour changer le statut d'une order via dropdown

const changeStatus = () => {
  // On récupère les éléments dont on a besoin
  if (document.getElementById('order-show-container')) {
    const statusItems = document.querySelectorAll('.dropdown-item'); // Les choix de la dropdown
    const inputField = document.getElementById('order_delivery_status'); // l'input caché du form
    const btnChangeStatus = document.getElementById('btn-change-status'); // le btn submit caché du form
    inputField.style.display= "none"; // On masque l'input
    // Add event au click sur un item de la dropdown
    statusItems.forEach((item) => {
      item.addEventListener('click', (event) => {
        const newStatus = event.currentTarget.innerText.toLowerCase() // On récupère le texte de l'item
        if (newStatus != inputField.value) {
          inputField.value = newStatus; // On change la value de l'input par le texte de l'item
          btnChangeStatus.click(); // On click sur le bouton submit qui envoie le PATCH au controller pour update
        }
      });
    });
  }

  if (document.getElementById('delivery-route-container')) {
    const statusItems = document.querySelectorAll('.dropdown-item'); // Les choix de la dropdown
    const inputField = document.getElementById('delivery_route_status'); // l'input caché du form
    const btnChangeStatus = document.getElementById('btn-change-status'); // le btn submit caché du form
    inputField.style.display= "none"; // On masque l'input
    // Add event au click sur un item de la dropdown
    statusItems.forEach((item) => {
      item.addEventListener('click', (event) => {
        const newStatus = event.currentTarget.innerText.toLowerCase() // On récupère le texte de l'item
        if (newStatus != inputField.value) {
          inputField.value = newStatus; // On change la value de l'input par le texte de l'item
          btnChangeStatus.click(); // On click sur le bouton submit qui envoie le PATCH au controller pour update
        }
      });
    });
  }
}

export { changeStatus };