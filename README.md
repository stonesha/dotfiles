# dotfiles

created using [chezmoi](https://www.chezmoi.io/)https://www.chezmoi.io/

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
