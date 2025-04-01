document.addEventListener("DOMContentLoaded", () => {
    actualizarUsuario();
});

function actualizarUsuario() {
    const usuarioLogeado = JSON.parse(localStorage.getItem("usuarioMesaExpress"))
    document.getElementById("usuario").innerText = `${usuarioLogeado.nombre}`;
    const logoutButton = document.getElementById("logout-button");
    if (logoutButton) {
        logoutButton.onclick = cerrarSesion;
    }
}
let cart = [];

function toggleCart() {
    document.getElementById("cart-dropdown").classList.toggle("active");
}

function addToCart(item) {
    cart.push(item);
    updateCart();
}

function removeFromCart(index) {
    cart.splice(index, 1);
    updateCart();
}



function updateCart() {
    const cartDropdown = document.getElementById("cart-dropdown");
    cartDropdown.innerHTML = cart.length ? cart.map((item, index) => `
        <div class="cart-item">
            <p>${item}</p>
            <button class="remove-item" onclick="removeFromCart(${index})">X</button>
        </div>
    `).join('') : "Carrito vacío";
}

const restaurants = [
    { color: "#rgb(162,209,73)", logo: "landding/IMAGES/KFC/KFC_Logo.svg.png", menu: [
        { name: "combos", desc: "Delicioso pollo con papas y gaseosa", img: "landding/IMAGES/KFC/combo1.webp" },
        { name: "Nuggets", desc: "Nuggets", img: "landding/IMAGES/KFC/nuggets.webp" },
        { name: "boxes", desc: "pollo, papas, helado, ensalada y gaseosa", img: "landding/IMAGES/KFC/combo 2.webp" }
    ] },
    { color: "#ff5733", logo: "landding/IMAGES/BurgerKing/burger.svg", menu: [
        { name: "Bondiola King", desc: "Deliciosa Hamburguesa de carne 100% de cerdo", img: "landding/IMAGES/BurgerKing/Banner-bondiola-02.png" },
        { name: "Mega Stacker Cheddar", desc: "Mega Hambuergesa con gaseosa", img: "landding/IMAGES/BurgerKing/Stacker cheddar_web-movil.png" },
        { name: "Whopper Vegetal", desc: "Hamburgesa Vegetal Con papas y gaseosa", img: "landding/IMAGES/BurgerKing/combo-whopper-vegetal.jpg" }
    ] },
    {  color: "#rgb(162,209,73)", logo: "landding/IMAGES/McDonalds/McDonald's-Logo.wine copy.png", menu: [
        { name: "Mc Crispy", desc: "Tan Pollo  Tan Crujiente Tan McDonalds", img: "landding/IMAGES/McDonalds/d9be3fc772fc6c0fd6b3471e291aa823.jpeg" },
        { name: "BT21", desc: "Combo De Nuggets", img: "landding/IMAGES/McDonalds/2-2.webp" },
        { name: "Super Cheddar Lover", desc: "Extra Queso con papas y gaseosa ", img: "landding/IMAGES/McDonalds/Mc_D_BANNER_WEB_B1_dc7bbf7bd6.jpg" }
    ] },
    {  color: "#ff5733", logo: "landding/IMAGES/PPC/images.png", menu: [
        { name: "Combo Churrasco", desc: "Delicioso Churrasco mas papas", img: "landding/IMAGES/PPC/combo Churrasco.jpg" },
        { name: "Pizza Peperoni", desc: "Dsifruta de una deliciosa pizza de peperoni", img: "landding/IMAGES/PPC/pizza peperoni.jpg" },
        { name: "Burgers & Wings", desc: "Combo de alitas grandes PPC", img: "landding/IMAGES/PPC/1727667044008-4872 Combo alitas PPC BW.jpg" }
    ] }
    
];

const restaurantContainer = document.getElementById("restaurant-container");

restaurants.forEach(restaurant => {
    const section = document.createElement("div");
    section.classList.add("restaurant");
    section.style.backgroundColor = restaurant.color;
    section.innerHTML = `
        <img src="${restaurant.logo}" alt="${restaurant.name} Logo">
        <button class="button-menu" onclick="toggleMenu(this)">Ver menú</button>
        <ul class="menu">
            ${restaurant.menu.map(item => `
                <li>
                    <img src="${item.img}" alt="${item.name}">
                    <div>
                        <strong>${item.name}</strong><br>
                        <small>${item.desc}</small>
                    </div>
                    <button class="add-to-cart" onclick="addToCart('${item.name}')">Agregar</button>
                </li>
            `).join('')}
        </ul>
    `;
    restaurantContainer.appendChild(section);
});

function toggleMenu(button) {
    const menu = button.nextElementSibling;
    menu.style.display = menu.style.display === "none" || menu.style.display === "" ? "flex" : "none";
}



function cerrarSesion() {
    localStorage.removeItem("usuario"); // Borrar usuario del almacenamiento local
    window.location.href = "login.html"; // Redirigir a login.html
}

