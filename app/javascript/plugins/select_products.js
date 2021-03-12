const displayProducts = () => {
  const categoryCards = document.querySelectorAll('.order-category-card');
  const categoriesContainer = document.getElementById('order-display-categories');
  const btnBack = document.getElementById('btn-back-categories');

  // On cache le container des produits à l'init
  const productsContainer = document.getElementById('order-display-products');
  productsContainer.style.display = "none";
  
  // On cache tous les produits à l'init
  const productCards = document.querySelectorAll('.order-content-product');
  productCards.forEach(product => product.style.display = "none");
  
  // Add event quand on clique sur une catégorie
  categoryCards.forEach((card) => {
    card.addEventListener('click', (event) => {
      const category = event.currentTarget.dataset.categoryname
      categoriesContainer.style.display = "none"; // On cache toutes les catégories
      productsContainer.style.display = null; // On affiche le container des products
      productCards.forEach((product) => {
        if (product.dataset.category == category) {
          product.style.display = null; // On affiche uniquement les products de la bonne catégorie
        }
      });
    });
  });

  // Retour à l'état initial quand on clique sur le btn Back
  btnBack.addEventListener('click', (event) => {
    productCards.forEach(product => product.style.display = "none");
    productsContainer.style.display = "none";
    categoriesContainer.style.display = null;
  });

}

export { displayProducts };