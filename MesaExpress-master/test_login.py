from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time

# Configurar el driver de Chrome
driver = webdriver.Chrome()

# Cargar la página de inicio de sesión
driver.get("file:///Users/mac/Desktop/MesaExpress-master/login.html")

# Esperar hasta que el campo email sea visible
WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.ID, "email")))

# Buscar los campos de usuario y contraseña
usuario = driver.find_element(By.ID, "email")  
contraseña = driver.find_element(By.ID, "password")

# Ingresar credenciales de prueba
usuario.send_keys("testuser@example.com")
contraseña.send_keys("password123")
contraseña.send_keys(Keys.RETURN)

# Esperar para ver si aparece una alerta
try:
    WebDriverWait(driver, 3).until(EC.alert_is_present())
    alert = driver.switch_to.alert
    print(f"⚠️ Apareció una alerta: {alert.text}")
    alert.dismiss()  # O usar alert.accept() si quieres aceptar la alerta en lugar de cerrarla.
except:
    print("✅ No se detectó ninguna alerta inesperada.")

# Esperar para ver el resultado
time.sleep(3)

# Tomar una captura de pantalla
driver.save_screenshot("resultado_login.png")

# Cerrar el navegador
driver.quit()

print("✅ Prueba de login ejecutada con éxito. Captura guardada como 'resultado_login.png'.")
