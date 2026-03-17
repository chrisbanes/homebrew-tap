class Verity < Formula
  desc "LLM-powered E2E testing for mobile and TV"
  homepage "https://github.com/chrisbanes/verity"
  url "https://github.com/chrisbanes/verity/releases/download/v0.0.1/verity-0.0.1.jar"
  sha256 "5b4b5529bd9586cae9bde9dbbad90d03817be6ac106ef85d63733f24567bf1ef"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install "verity-#{version}.jar" => "verity.jar"

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
