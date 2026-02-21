# typed: false
# frozen_string_literal: true

# Auto-updated by zpl-toolchain release automation.
class ZplToolchain < Formula
  desc "ZPL II toolchain for parsing, validating, formatting, and printing Zebra labels"
  homepage "https://github.com/trevordcampbell/zpl-toolchain"
  version "0.1.16"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/trevordcampbell/zpl-toolchain/releases/download/v0.1.16/zpl-aarch64-apple-darwin.tar.gz"
      sha256 "dc7e72b717b52d3bd9f5e004ce67525c468edc5e587377adca13e11ff5f82f82"
    end
    on_intel do
      odie "zpl-toolchain does not provide a pre-built binary for Intel Mac. Use: cargo install zpl_toolchain_cli"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/trevordcampbell/zpl-toolchain/releases/download/v0.1.16/zpl-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a26f69e0d0d82a4379a2493df064dee892fdc607ae6989f5630b34f810acc6f7"
    end
    on_arm do
      odie "zpl-toolchain does not provide a pre-built binary for Linux ARM64. Use: cargo install zpl_toolchain_cli"
    end
  end

  def install
    bin.install "zpl"
  end

  test do
    assert_match(/zpl \d+\.\d+/, shell_output("\#{bin}/zpl --version 2>&1"))
  end
end
