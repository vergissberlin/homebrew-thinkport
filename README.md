# Thinkport Homebrew Tap

This is a [Homebrew tap](https://docs.brew.sh/Taps) for Thinkport's open source projects.

## Usage

To install a formula from this tap, run:

```sh
brew tap vergissberlin/tap
brew install <formula>
```

Or, to install the latest development version of a formula, run:

```sh
brew install --HEAD vergissberlin/tap/<formula>
```

### Formulae

| Formula | Description |
| ------- | ----------- |
| [thinkport](Formula/thinkport.rb) | Informations about Thinkport GmbH |

## Contributing

To add a new formula to this tap, run:

```sh
brew create <url>
```

Then, edit the generated formula file to add a description, update the homepage, and add a test.

### Create sha

```sh
wget <file>
shasum -a 256 <file>
```

## License

[MIT](LICENSE)
