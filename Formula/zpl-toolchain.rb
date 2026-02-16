# typed: false
# frozen_string_literal: true

# Auto-updated by zpl-toolchain release automation.
class ZplToolchain < Formula
  desc "ZPL II toolchain for parsing, validating, formatting, and printing Zebra labels"
  homepage "https://github.com/trevordcampbell/zpl-toolchain"
  version "0.1.15"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/trevordcampbell/zpl-toolchain/releases/download/v0.1.15/zpl-aarch64-apple-darwin.tar.gz"
      sha256 "deac28ed26c6f474feb9c483c8684c73384f5dcd67cb1f90f2819b5718738f75"
    end
    on_intel do
      odie "zpl-toolchain does not provide a pre-built binary for Intel Mac. Use: cargo install zpl_toolchain_cli"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/trevordcampbell/zpl-toolchain/releases/download/v0.1.15/zpl-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a72d3462930f8b634396a93c8de0c74dda945a6066dedb93ee3c3282895ee8f0"
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
