cask "portico" do
  version "0.0.2"
  sha256 "254de987bc3f6d6a2869cc59d5982f6738f87a4124a64ec7ad0a674d6762f50b"

  url "https://github.com/chrisbanes/portico/releases/download/v#{version}/Portico-#{version}.dmg"
  name "Portico"
  desc "Make a web service on your Mac reachable on your tailnet"
  homepage "https://github.com/chrisbanes/portico"

  depends_on macos: :sonoma

  app "Portico.app"
end
