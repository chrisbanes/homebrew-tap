class Verity < Formula
  desc "LLM-powered E2E testing for mobile and TV"
  homepage "https://github.com/chrisbanes/verity"
  url "https://github.com/chrisbanes/verity/releases/download/v0.0.2/verity-0.0.2.jar"
  sha256 "d14ea70641b2173ad0e836db77e16212e98896f8c021cce57f1370b5f0f2e564"
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
