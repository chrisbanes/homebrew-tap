class Verity < Formula
  desc "LLM-powered E2E testing for mobile and TV"
  homepage "https://github.com/chrisbanes/verity"
  version "0.1.0"
  url "https://github.com/chrisbanes/verity/releases/download/v#{version}/verity-#{version}.jar", using: :nounzip
  sha256 "782bd0b02393748827a7af2453c14b753997b1e3655ecad0081875b3258de089"
  on_macos do
    on_arm do
      url "https://github.com/chrisbanes/verity/releases/download/v#{version}/verity-#{version}-macos-aarch64.jar", using: :nounzip
      sha256 "6cc65a9e67029306679d3d7289592be0c93ff2cc878e9ca74a497bddbd11303b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/chrisbanes/verity/releases/download/v#{version}/verity-#{version}-linux-x86_64.jar", using: :nounzip
      sha256 "bb20226cf9b5e21c7405fd2b0b096fe1d60abcac794372f5b14a699dbd4891c2"
    end
  end

  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    suffix = if OS.mac? && Hardware::CPU.arm?
      "-macos-aarch64"
    elsif OS.linux? && Hardware::CPU.intel?
      "-linux-x86_64"
    else
      ""
    end
    libexec.install "verity-#{version}#{suffix}.jar" => "verity.jar"

    (bin/"verity").write <<~BASH
      #!/bin/bash
      export JAVA_HOME="#{Formula["openjdk@21"].opt_prefix}"
      exec "${JAVA_HOME}/bin/java" -jar "#{libexec}/verity.jar" "$@"
    BASH
  end

  test do
    assert_match "verity", shell_output("#{bin}/verity --help")
  end
end
