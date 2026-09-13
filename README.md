# Review development tap

Personal Bluefin Review builds from exact commits in joshyorko/review.

On Linux:

```sh
brew install joshyorko/review-dev/bluefin-review-dev
bluefin review owner/repo
```

After the personal package workflow succeeds, run `brew update` and
`brew upgrade bluefin-review-dev`. Startup displays the source ref and commit.

This channel is separate from `ublue-os/experimental-tap/bluefin-contributor-tools`.
Uninstall one before installing the other; both provide `bluefin`.
