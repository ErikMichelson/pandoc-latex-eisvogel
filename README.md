# Dockerized pandoc/latex with Eisvogel template

This repository contains the containerization of [pandoc/latex](https://hub.docker.com/r/pandoc/latex/) altogether with the [Eisvogel](https://github.com/Wandmalfarbe/pandoc-latex-template/) template.

This docker image can be used to convert markdown files to pretty pdfs.

## Usage
Assuming there is a file `test.md` in your working directory, the following command will turn it into a pdf called `test.pdf`.
```sh
docker run --rm -v "$(pwd):/data" quay.io/emcrx/pandoc-latex-eisvogel:latest pdf test.md
```

The docker container can also be used to output the raw `.tex` file for manual post-processing.
```sh
docker run --rm -v "$(pwd):/data" quay.io/emcrx/pandoc-latex-eisvogel:latest tex test.md
```

For manual pandoc calls, you can use the shell.
```sh
docker run --rm -v "$(pwd):/data" quay.io/emcrx/pandoc-latex-eisvogel:latest shell
```

## Attribution
Special thanks to [Pascal Wagler (@wandmalfarbe)](https://github.com/Wandmalfarbe) for creating the pretty Eisvogel template.

## License
MIT
