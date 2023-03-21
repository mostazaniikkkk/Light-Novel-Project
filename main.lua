dofile("src/lib/noobel.lua")

background = Image.load("textures/00123.png")
char = Image.load("textures/reference.png")
text00 = "Hola, esto es el modulo de testing, en este"
text01 = "puedes probar diferentes funciones, cual te"
text02 = "interesa probar ahora?"
text03 = "Desde esta linea el texto es relleno para"
text04 = "ver cuantas lineas soporta la textbox."
switch = true
name = "Debug-Chan"

TextLoad(1, char, char, 0, true, 0, Color.new(0, 128, 0))
