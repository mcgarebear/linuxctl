# linux

Common settings, scripts, and things for my personal linux boxes.


## Install

Clone the repository somewhere, I put things in `~/code`.

```bash
mkdir --parents "${HOME}/code"
git clone git@github.com/mcgarebear/linux.git "${HOME}/code/linux"
```

### Dotfiles

Place the desired dotfiles into the home directory. To get prompt customization
working with user `root` (or when using `sudo`), copy to `root`'s home. You
can have these files in new user's `${HOME}` by copying to `/etc/skel`.

```bash
cp --archive --recursive "${HOME}/code/linux/dotfiles/." "${HOME}/"
sudo cp --archive --recursive "${HOME}/code/linux/dotfiles/." "/root/"
sudo cp --archive --recursive "${HOME}/code/linux/dotfiles/." "/etc/skel/"
```

Then load `.env` file from your shell:

```bash
source "${HOME}/.env"
```

To make the prompt environment changes permenent, source the env file in your
shell configuration.

```bash
# Example Bash
echo '[[ -f ~/.env]] && source ~/.env' >> ~/.bashrc
```

### Scripts

Create a symbolic link. `dotfile/.env` appends `~/bin` to your `${PATH}`.

```bash
ln --symbolic "${HOME}/code/linux/bin" "${HOME}/bin"
```
