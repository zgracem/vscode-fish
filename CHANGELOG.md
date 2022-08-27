# Change Log

## 0.7.1

- Allow syntax highlighting in restricted mode
- Added configuration variables from upstream: `fish.path.fish` and
  `fish.path.fish_indent` can now override the location of the `fish` and
  `fish_indent` executables in your default PATH

## 0.7.0

- New `if…else` and `status` snippets
- Added optional `-d|--description` to `function` snippet
- Internal fish variables (e.g. `$__fish_config_dir`) are now also highlighted
- Updated syntax definitions to support fish 3.4 syntax, based on latest
  [Phidica/sublime-fish]

[Phidica/sublime-fish]: https://github.com/Phidica/sublime-fish

## 0.6.0

- New `contains` snippet
- Forked ST2-era source syntax definition to facilitate future development
- Improved live indentation and comment formatting
- Added folding markers

## 0.5.4

- New `argparse` snippet

## 0.5.3

- Renamed new syntax to "Universal fish variables" so that typing `Cmd+K`,
  `Cmd+M`, `fis`… doesn't autocomplete to `fish_variables` first.
- Slight improvements to indentation settings.
- Improved snippets.

## 0.5.2

- Add syntax highlighting for `fish_variables` (and legacy `fishd.*`) files.
- Include configuration defaults for `.fish` files (indent with 4 spaces only).

## 0.5.1

- Fix broken embedded code blocks in Markdown documents.

## 0.5.0

- Add formatting and linting from [bmalehorn/vscode-fish].

[bmalehorn/vscode-fish]: https://github.com/bmalehorn/vscode-fish

## 0.4.1

- Fixed a syntax highlighting bug

## 0.4.0

- Detect files that start with a `fish` hashbang
- Support embedded code blocks in Markdown documents

## 0.3.0

- Added indentation rules for `switch...case` statements

## 0.2.1

- Improved auto-closing quotes

## 0.2.0

- Improved indentation regexes

## 0.1.1

- Update metadata and README

## 0.1.0

- Initial release
