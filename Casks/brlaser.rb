# typed: strict
# frozen_string_literal: true

cask "brlaser" do
  version "6.2.8"
  sha256 "16dae855aa7fff0eef0c05398fab37678243d7d610fa5f9af0d3a2cc9bf08cb0"

  url "https://github.com/Owl-Maintain/brlaser/archive/refs/tags/v6.2.8.tar.gz"
  name "brlaser"
  desc "CUPS driver for Brother laser printers"
  homepage "https://github.com/Owl-Maintain/brlaser"

  livecheck do
    url "https://github.com/Owl-Maintain/brlaser"
    strategy :github_latest
  end

  depends_on formula: "cmake"

  preflight_steps do
    run "/usr/bin/ppdc",
        args: [
          "-d", "{{staged_path}}/brlaser-#{version}/ppd",
          "{{staged_path}}/brlaser-#{version}/brlaser.drv",
        ]
    run "/opt/homebrew/bin/cmake",
        args: [
          "-S", "{{staged_path}}/brlaser-#{version}",
          "-B", "{{staged_path}}/build",
          "-DCMAKE_BUILD_TYPE=Release",
        ]
    run "/opt/homebrew/bin/cmake",
        args: ["--build", "{{staged_path}}/build"]
  end

  postflight_steps do
    run "/opt/homebrew/bin/cmake",
        args: ["--install", "{{staged_path}}/build"],
        sudo: true

    run "/bin/launchctl",
        args: ["stop", "org.cups.cupsd"],
        sudo: true
    run "/bin/launchctl",
        args: ["start", "org.cups.cupsd"],
        sudo: true
  end

  uninstall_preflight_steps do
    remove [
      "/Library/Printers/brlaser/Filter/rastertobrlaser",
      "/Library/Printers/PPDs/Contents/Resources/br*.ppd",
    ], recursive: true, sudo: true

    run "/bin/launchctl",
        args: ["stop", "org.cups.cupsd"],
        sudo: true
    run "/bin/launchctl",
        args: ["start", "org.cups.cupsd"],
        sudo: true
  end

  caveats <<~EOS
    The brlaser CUPS driver has been installed and CUPS has been restarted.

    Add your Brother printer using System Settings > Printers & Scanners.
    Look for printer entries marked 'brlaser'.
  EOS
end
