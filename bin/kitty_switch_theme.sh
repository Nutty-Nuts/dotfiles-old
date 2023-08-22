#!/bin/bash
pattern=$1

sed -i '1d' ~/.config/kitty/kitty.conf
sed -i "1 i\include $pattern" ~/.config/kitty/kitty.conf
