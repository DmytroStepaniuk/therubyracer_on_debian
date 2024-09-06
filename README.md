# Run

```shell
make test
```

## Clone and run

```shell
git clone https://github.com/DmytroStepaniuk/therubyracer_on_debian.git && cd therubyracer_on_debian && make test
```

# Expected

`therubyracer` is working perfectly fine.

# Actual

`therubyracer` is not worrking at all. And this is deprecated.

# Other solutions

Other solutions are related MacOS, but this will not work on Debian. 

Check out [this](https://stackoverflow.com/a/67518081) for mo details

# Assumtions

Probably we need to pass `--with-v8-dir` with correct v8 sources/binaries for `therubyracer` build config, there is no clarity on that at all...
