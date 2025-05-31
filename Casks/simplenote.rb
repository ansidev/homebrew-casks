cask "simplenote" do
  version "2.23.2"
  sha256 "3ea1ae52f355d972c1796401feaaa8486c79acca6cdec6b19230f8db81e34f78"

  url "https://github.com/Automattic/simplenote-electron/releases/download/v#{version}/Simplenote-macOS-#{version}.dmg",
      verified: "github.com/Automattic/simplenote-electron/"
  name "Simplenote"
  desc "Simplest way to keep notes"
  homepage "https://simplenote.com/"

  livecheck do
    url "https://github.com/Automattic/simplenote-electron"
    regex(/v?(\d+(?:[.-]\d+)+)/i)
    strategy :github_latest
  end

  auto_updates true

  app "Simplenote.app", target: "Simplenote.app"
end
