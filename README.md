# init.rc [![Build Status](https://img.shields.io/github/workflow/status/bkahlert/init/build?label=Build&logo=github&logoColor=fff)](https://github.com/bkahlert/init/actions/workflows/build.yml) [![Repository Size](https://img.shields.io/github/repo-size/bkahlert/init?color=01818F&label=Repo%20Size&logo=Git&logoColor=fff)](https://github.com/bkahlert/init) [![Repository Size](https://img.shields.io/github/license/bkahlert/init?color=29ABE2&label=License&logo=data%3Aimage%2Fsvg%2Bxml%3Bbase64%2CPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCA1OTAgNTkwIiAgeG1sbnM6dj0iaHR0cHM6Ly92ZWN0YS5pby9uYW5vIj48cGF0aCBkPSJNMzI4LjcgMzk1LjhjNDAuMy0xNSA2MS40LTQzLjggNjEuNC05My40UzM0OC4zIDIwOSAyOTYgMjA4LjljLTU1LjEtLjEtOTYuOCA0My42LTk2LjEgOTMuNXMyNC40IDgzIDYyLjQgOTQuOUwxOTUgNTYzQzEwNC44IDUzOS43IDEzLjIgNDMzLjMgMTMuMiAzMDIuNCAxMy4yIDE0Ny4zIDEzNy44IDIxLjUgMjk0IDIxLjVzMjgyLjggMTI1LjcgMjgyLjggMjgwLjhjMCAxMzMtOTAuOCAyMzcuOS0xODIuOSAyNjEuMWwtNjUuMi0xNjcuNnoiIGZpbGw9IiNmZmYiIHN0cm9rZT0iI2ZmZiIgc3Ryb2tlLXdpZHRoPSIxOS4yMTIiIHN0cm9rZS1saW5lam9pbj0icm91bmQiLz48L3N2Zz4%3D)](https://github.com/bkahlert/init/blob/main/LICENSE)

## About

**init** provides access to the following tools in one place:
* `bats` Run Bats (Bash Automated Testing System) tests
* `libguestfs` (i.e. `guestfish`, `virt-customize`) Tools for accessing and modifying virtual machine disk images
* `recordr` Record terminal sessions and convert them to SVG

[![recorded terminal session listing provided binaries](docs/help--140x54.svg "init.rc --help")  
*init.rc --help*](../../raw/main/docs/help--140x54.svg)

[![recorded terminal session demonstrating guestfish](docs/guestfish.svg "init.rc guestfish")  
*init.rc guestfish*](../../raw/main/docs/guestfish.svg)

## Usage

### Sourcing

If sourced, all provided binaries that can't be found locally are aliased and
can be used for the rest of the current shell session.

```shell
source <(curl -LfsS https://git.io/init.rc)
bats test
```

### Executing

If executed, a single command can be invoked without further modifications
of the current shell session.

```shell
curl -LfsS https://git.io/init.rc | "$SHELL" -s -- bats test
```

## Testing

```shell
git clone https://github.com/bkahlert/init.git
cd init

# Use Bats wrapper to run tests
curl -LfsS https://git.io/batsw \
  | DOCKER_BAKE="--set '*.tags=test'" "$SHELL" -s -- --batsw:-e --batsw:BUILD_TAG=test test
```

[Bats Wrapper](https://github.com/bkahlert/bats-wrapper) is a self-contained wrapper to run tests based on the Bash testing
framework [Bats](https://github.com/bats-core/bats-core).

> 💡 To accelerate testing, the Bats Wrapper checks if any test is prefixed with a capital X and if so, only runs those tests.

## Contributing

Want to contribute? Awesome! The most basic way to show your support is to star the project, or to raise issues. You can also support this project by making
a [PayPal donation](https://www.paypal.me/bkahlert) to ensure this journey continues indefinitely!

Thanks again for your support, it is much appreciated! :pray:

## License

MIT. See [LICENSE](LICENSE) for more details.
