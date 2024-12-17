# <Project-Name>

## Generate new Angular Project

First rename the project's `README.md` because Angular's useless `README` conflics with mine and the dumbass CLI cannot ignore it when generating a project.

```bash
ng new <project-name> --directory ./ --ssr false --routing true --style css
```


## Run the project

Fix `<project-name>` inside `compose.yaml` to generate correct container names.

```bash
docker compose up --build --detach
```

```bash
docker compose down
```

_Open project on `127.0.0.1` if inside a `WSL2`._
