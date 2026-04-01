class Ensemble < Formula
  desc "Multi-agent pipeline orchestrator"
  homepage "https://github.com/chrisbanes/ensemble"
  license "MIT"
  version "0.0.1"

  on_macos do
    on_arm do
      url "https://github.com/chrisbanes/ensemble/releases/download/v0.0.1/ensemble-v0.0.1-aarch64-apple-darwin.tar.gz"
      sha256 "175d25bd56b01e81d5bb4d09719f47ca1d1fb6752a0b90e24527ebaeb8af09e0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/chrisbanes/ensemble/releases/download/v0.0.1/ensemble-v0.0.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "68cd5ac6a1e9815b9fcba70668894aefc69d13b246e19b0ce630463e7f0aa9d0"
    end
    on_intel do
      url "https://github.com/chrisbanes/ensemble/releases/download/v0.0.1/ensemble-v0.0.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4f6373f805bf2f111f0dd6912331ffd7302f5f2323450575907a2a8a4fbe80e4"
    end
  end

  def install
    bin.install "ensemble"
  end

  test do
    assert_match "ensemble", shell_output("\#{bin}/ensemble --help")
  end
end
