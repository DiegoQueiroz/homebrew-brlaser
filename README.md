# homebrew-brlaser

CUPS driver for Brother laser printers, packaged as a Homebrew cask.

## What this tap is

This tap does not keep a copy of the driver source code. It points directly at
the [Owl-Maintain/brlaser](https://github.com/Owl-Maintain/brlaser) releases,
so any improvement that lands there reaches this tap as soon as the bump
workflow runs.

## Supported printers

Brother laser printers supported by the upstream brlaser project (DCP, HL, MFC
series). See the [list of known supported printers](https://github.com/Owl-Maintain/brlaser#supported-printers) in the Owl-Maintain/brlaser repository.

This driver only supports Monochrome Laser Printers, any other printer types (e.g. Color Laser or InkJet) will not work with this driver.

## Installation

Run the three commands below in order, as a single step:

```sh
brew tap DiegoQueiroz/brlaser
brew trust DiegoQueiroz/brlaser
brew install --cask brlaser
```

### Adding the printer

Open System Settings > Printers & Scanners, click "Add Printer, Scanner, or
Fax...", and look for entries marked with `brlaser`.

## Upgrading

```sh
brew upgrade --cask brlaser
```

## Uninstalling

```sh
brew uninstall --cask brlaser
```

## Notes

- The cask compiles the driver locally on install, so a C++ toolchain (via the
  `cmake` formula) is required and pulled in automatically.
- Installing or uninstalling restarts CUPS to pick up the driver changes.

## History: why Owl-Maintain and not the original

The brlaser driver was created by Peter De Wachter in 2013, in the
[pdewacht/brlaser](https://github.com/pdewacht/brlaser) repository. It is the
open-source CUPS driver for monochrome Brother laser printers (and some
multifunction models) that do not speak standard PCL/PostScript.

The original repository is dormant: its last activity was in 2023, its last
official release was in 2019, and it has accumulated 147 open issues. It was
never officially archived, but it does not receive active maintenance.

The [Owl-Maintain/brlaser](https://github.com/Owl-Maintain/brlaser) fork is
what the community adopted to continue the project. It is active, has a steady
release cadence, has added dozens of new printer models, and has macOS CI that
validates the generated PPDs with cupstestppd. Distributions such as Ubuntu and
Void Linux have already moved to this fork.

This tap follows the same path: it installs the driver from the active fork,
not from the frozen original.

## Credits

- Original driver: Peter De Wachter ([pdewacht/brlaser](https://github.com/pdewacht/brlaser))
- Active fork packaged here: [Owl-Maintain/brlaser](https://github.com/Owl-Maintain/brlaser)
- Homebrew packaging for macOS inspired by the
  [ws/homebrew-brlaser](https://github.com/ws/homebrew-brlaser) tap
