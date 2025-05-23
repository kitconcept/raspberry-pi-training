# Make LED blink

# Install gpiozero

```
$ sudo apt update
$ sudo apt install python3-gpiozero
```

# GPIO Pin Belegung

https://gpiozero.readthedocs.io/en/latest/recipes.html

# LEDs an/aus

Python:

```
>>> from gpiozero import LED

>>> white = LED(3)
>>> white.on()

>>> orange = LED(27)
>>> orange.on()

>>> red = LED(15)
>>> red.on()

>>> green = LED(10)
>>> green.on()
```

# Ampel

Ampel (GND/R/G/B):

```
>>> ampel_red = LED(26)
>>> ampel_yellow = LED(19)
>>> ampel_green = LED(13)
```
