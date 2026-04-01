cask "ensemble-desktop" do
  version "0.0.1"
  sha256 "14ebe5ed8968e6ade6c7df033e662208964f55414e34f249927c8dba81196e11"

  url "https://github.com/chrisbanes/ensemble/releases/download/v0.0.1/Ensemble_0.0.1_aarch64.dmg"
  name "Ensemble"
  desc "Multi-agent pipeline orchestrator"
  homepage "https://github.com/chrisbanes/ensemble"

  depends_on arch: :arm64

  app "Ensemble.app"
end
