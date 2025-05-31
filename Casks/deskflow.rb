cask "deskflow" do
  arch arm:   "arm64",
       intel: "x86_64"

  version "1.22.0"
  sha256 arm:          "7181966f1528fca707193484a404a2626bd8778dfe4838d2740f27b7b4868804",
         intel:        "ecd1f3446d38ced3cb5fbf1651d599f3b454b3483bf0029ff9ae044f7042d3e5",
         arm64_linux:  "0",
         x86_64_linux: "0"

  url "https://github.com/deskflow/deskflow/releases/download/v#{version}/deskflow-#{version}-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Share a single keyboard and mouse between multiple computers"
  homepage "https://deskflow.org/"

  livecheck do
    url "https://github.com/deskflow/deskflow"
    regex(/v?(\d+(?:[.-]\d+)+)/i)
    strategy :github_latest
  end

  auto_updates true

  app "Deskflow.app", target: "Deskflow.app"
end
