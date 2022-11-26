# `punktf` - A cross-platform multi-target dotfiles manager
[![MIT License](https://img.shields.io/crates/l/punktf)](https://choosealicense.com/licenses/mit/) [![GitHub Issues](https://img.shields.io/github/issues/Shemnei/punktf)](https://github.com/Shemnei/punktf/issues?q=is%3Aissue+is%3Aopen+sort%3Aupdated-desc) [![Continuous Integration](https://github.com/Shemnei/punktf/workflows/CI/badge.svg)](https://github.com/Shemnei/punktf/actions) [![rust docs](https://docs.rs/punktf-lib/badge.svg)](https://docs.rs/punktf-lib/latest/punktf_lib/) [![Crates.io](https://img.shields.io/crates/v/punktf)](https://crates.io/crates/punktf) [![Homebrew](https://img.shields.io/badge/dynamic/json.svg?url=https://raw.githubusercontent.com/michidk/homebrew-tools/main/Info/punktf.json&query=$.versions.stable&label=homebrew)](https://github.com/michidk/homebrew-tools/blob/main/Formula/punktf.rb) [![AUR](https://img.shields.io/aur/version/punktf)](https://aur.archlinux.org/packages/punktf) [![Chocolatey](https://img.shields.io/chocolatey/v/punktf?include_prereleases)](https://community.chocolatey.org/packages/punktf)

## Yet another dotfile manager?!

Well, yes, but hear me out: This project was driven by the personal need of having to manage several dotfiles for different machines/targets. You want the same experience everywhere: On your Windows workstation along with an Ubuntu WSL instance, your Debian server and your private Arch installation. This tool fixes that problem while being cross-platform and blazingly fast. You won't need multiple sets of dotfile configurations ever again!

Features:

- Compile and deploy your dotfiles with one command across different platforms
- Use handlebar-like instructions to insert variables and compile sections conditionally
- Define pre- and post-hooks to customize the behavior with your own commands
- Create multiple profiles for different targets
- Works on Windows and Linux
