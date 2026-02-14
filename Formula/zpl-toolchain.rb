# typed: false
# frozen_string_literal: true

# Auto-updated by zpl-toolchain release automation.
class ZplToolchain < Formula
  desc "ZPL II toolchain for parsing, validating, formatting, and printing Zebra labels"
  homepage "https://github.com/trevordcampbell/zpl-toolchain"
  version "0.1.13"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/trevordcampbell/zpl-toolchain/releases/download/v0.1.13/zpl-aarch64-apple-darwin.tar.gz"
      sha256 "e6521ff4a02411adf1b94cb427c12b36d25ba0d07399608f5e92bde28e39929c"
    end
    on_intel do
      odie "zpl-toolchain does not provide a pre-built binary for Intel Mac. Use: cargo install zpl_toolchain_cli"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/trevordcampbell/zpl-toolchain/releases/download/v0.1.13/zpl-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "933d4fd91b09f42736408828a8ec8debbbe91a509a13486c1c9da1e92bfb217a"
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
