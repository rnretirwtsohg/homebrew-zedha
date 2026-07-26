# homebrew-zedha

Homebrew cask for [Zedha](https://github.com/rnretirwtsohg/zedha), an
independent downstream distribution of the Zed editor.

```bash
brew install --cask rnretirwtsohg/zedha/zedha
```

Zedha releases are currently unsigned and not notarized. After Homebrew
verifies the cask's pinned SHA-256, the cask removes quarantine from Zedha only
so macOS can launch the app. It does not change global Gatekeeper settings.

The cask intentionally supports Apple Silicon only until Zedha publishes an
Intel artifact. Zedha stable builds do not self-update; version, URL, and
checksum changes in this tap drive upgrades through Homebrew.
