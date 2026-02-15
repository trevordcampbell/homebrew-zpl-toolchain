# typed: false
# frozen_string_literal: true

# Auto-updated by zpl-toolchain release automation.
class ZplToolchain < Formula
  desc "ZPL II toolchain for parsing, validating, formatting, and printing Zebra labels"
  homepage "https://github.com/trevordcampbell/zpl-toolchain"
  version "0.1.14"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/trevordcampbell/zpl-toolchain/releases/download/v0.1.14/zpl-aarch64-apple-darwin.tar.gz"
      sha256 "0d4e4ed8cb1f3101156e62aec4c25ded0eaac969b509ea8e0ea423e44fa2a399"
    end
    on_intel do
      odie "zpl-toolchain does not provide a pre-built binary for Intel Mac. Use: cargo install zpl_toolchain_cli"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/trevordcampbell/zpl-toolchain/releases/download/v0.1.14/zpl-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5d587d12c7c7dd6db82cfab6e6a14c0966fc77343ff7921ce83a9ec49aa08db1"
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
