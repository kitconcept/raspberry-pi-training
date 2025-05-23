# Make LED blink

# Install gpiozero

```
$ sudo apt update
$ sudo apt install python3-gpiozero
```

# GPIO Pin Belegung

https://gpiozero.readthedocs.io/en/latest/recipes.html

# LEDs an/aus

GPIO:

```
..
..
oo (GPIO 3 / GND) -> white
..
oo (GND / GPIO 15) -> red
..
oo (GPIO 27 / GND) -> orange
..
..
oo (GPIO 10 / GND) -> green
..
..
..
..
..
..
..
```

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

# Ampel (GND/R/G/B)

GPIO:

```
..
..
..
..
..
..
..
..
..
..
..
..
..
..
..
o. (GPIO13 -> GREEN)
o. (GPIO19 -> YELLOW)
o. (GPIO26 -> RED)
o. (GND)
```

Python:

```
>>> ampel_red = LED(26)
>>> ampel_yellow = LED(19)
>>> ampel_green = LED(13)
```
