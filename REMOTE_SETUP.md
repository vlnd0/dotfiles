# Remote Repository Setup

Когда будете готовы создать remote репозиторий:

## GitHub (приватный)
```bash
cd ~/dotfiles
gh repo create dotfiles --private --source=. --remote=origin --push
```

## GitLab
```bash
cd ~/dotfiles
git remote add origin git@gitlab.com:yourusername/dotfiles.git
git push -u origin main
```

## Обычный Git сервер
```bash
cd ~/dotfiles
git remote add origin git@your-server.com:dotfiles.git
git push -u origin main
```
