# dotfiles

created using [chezmoi](https://www.chezmoi.io/)

After installing chezmoi, run:
```bash
chezmoi init https://github.com/stonesha/dotfiles.git
```
Check what changes that chezmoi will make to your home directory by running:
```bash
chezmoi diff
```
If you are happy with the changes that chezmoi will make then run:
```bash
chezmoi apply -v
```
On any machine, you can pull and apply the latest changes from your repo with:
```bash
chezmoi update -v
```

You can install your dotfiles on new machine with a single command:
```bash
chezmoi init --apply https://github.com/$GITHUB_USERNAME/dotfiles.git
```
If you use GitHub and your dotfiles repo is called dotfiles then this can be shortened to:
```bash
chezmoi init --apply $GITHUB_USERNAME
```
