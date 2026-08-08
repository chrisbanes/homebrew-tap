cask "portico" do
  version "0.0.1"
  sha256 "bdb0858934440f345902808bfacf9d79d83d073c9ab7ada04739a7d424cffe82"

  url "https://github.com/chrisbanes/portico/releases/download/v#{version}/Portico-#{version}.dmg"
  name "Portico"
  desc "Make a web service on your Mac reachable on your tailnet"
  homepage "https://github.com/chrisbanes/portico"

  depends_on macos: :sonoma

  app "Portico.app"
end
