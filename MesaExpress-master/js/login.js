let formulario = document.getElementById("formLogin");

async function hashPassword(password) {
    const encoder = new TextEncoder();
    const data = encoder.encode(password);
    const hashBuffer = await crypto.subtle.digest('SHA-256', data);
    const hashArray = Array.from(new Uint8Array(hashBuffer));
    const hashHex = hashArray.map(byte => byte.toString(16).padStart(2, '0')).join('');
    return hashHex;
}

formulario.addEventListener("submit", async (e) => {
    e.preventDefault();
    console.log("Recibiendo datos");

    let emailValue = document.getElementById("email").value;
    let passwordValue = await hashPassword(document.getElementById("password").value);

    let credenciales = {
        "email": emailValue,
        "password": passwordValue,
    };

    try {
        const response = await fetch("http://127.0.0.1:5000/auth/login", {

            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(credenciales),
        });

        const data = await response.json();

        if (response.ok) {
            alert('Login exitoso!');
            alert("Usted ha tenido un login exitoso, su rol es: " + data.usuario.rol);

            localStorage.setItem("usuarioMesaExpress", JSON.stringify(data.usuario));
            console.log(data.usuario);


            // Redirección según el rol del usuario
            if (data.usuario.rol === "Admin") {
                window.location.href = "admin.html";
            } else if (data.usuario.rol === "Cliente") {
                window.location.href = "paginaPrincipal.html";
            } else if (data.usuario.rol === "Restaurante") {
                window.location.href = "Restaurante.html";
            } else {
                alert("Rol no reconocido, contacte con soporte.");
            }
        } else {
            alert('Datos incorrectos!');
            document.getElementById("errorMessage").textContent = data.message || 'Error al iniciar sesión.';
            document.getElementById("errorMessage").style.display = 'block';
            window.location.href = "login.html";
        }
    } catch (error) {
        console.error("Error en la petición:", error);
        alert("Error al conectar con el servidor.");
    }
});







