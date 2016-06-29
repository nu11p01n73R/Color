#Color

`color` is a simple utility which helps to change the base 16 terminal color schemes on the go.

#Requirements

The `color` is based on [Base16 shell project](https://github.com/chriskempson/base16-shell). 

Clone the project. Read installation steps from the github repo [here](https://github.com/chriskempson/base16-shell#installation). 

The `~/.bashrc` changes are not required for Base16 as `color` will take care of it.


#Installation

Clone the repo

```
git clone https://github.com/nu11p01n73R/Color ~/.config/Color
```

Edit `color.sh` file to the correct directory location of Base16

```
BASE16_PATH="$HOME/.config/base16-shell
```

Edit your `~/.bashrc/` or `/.profiles` file to add the following line

```
export COLOR_PATH="$HOME/.config/Color"
[[ -f "$COLOR_PATH/color.sh" ]] && source "$COLOR_PATH/color.sh" && load_color
```

#Usage

You can change the color scheme using the command,

```
color tomorrow dark
```

The color can be changed by keeping the current background as

```
color ocean
```

All the available colors can be listed by using

```
color list
```

Just the `color` with no arguments will give you the current scheme and background.

