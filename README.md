# linux

Common settings, scripts, and things for my personal linux boxes.


## Install

Clone the repository somewhere, I put things in `~/code`.

```bash
mkdir --parents "${HOME}/code"
git clone git@github.com/mcgarebear/linux.git "${HOME}/code/linux"
```

Place the desired dotfiles into the home directory. To get prompt customization
working with user `root` (or when using `sudo`), copy to `root`'s home.

```bash
cp --archive --recursive "${HOME}/code/linux/dotfiles/." "${HOME}/"
```
