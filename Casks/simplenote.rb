cask "simplenote" do
  version "2.21.0"
  sha256 "431e83a0982414a3932f4e4b408a9ae125f84118be1f810c11a84e2d8c1aa740"

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
