# https://peazip.github.io/changelog.html
cask "peazip" do
  arch arm:   "aarch64",
       intel: "x86_64"

  version "9.6.0"
  sha256 arm:   "8e5fbd077adefa44ed31bf32e95bfc3580d04c949541f0222006a4b21622bd7a",
         intel: "d1cd6d0e0bd2b2e7e63085c3bdd3ec4d851aecaef0991ead302913b1e3e925cb"

  url "https://github.com/peazip/PeaZip/releases/download/#{version}/peazip-#{version}.DARWIN.#{arch}.dmg",
      verified: "github.com/peazip/PeaZip/"
  name "PeaZip"
  desc "Free file archiver utility"
  homepage "https://peazip.github.io/"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:[.-]\d+)+)/i)
    strategy :github_latest
  end

  auto_updates true

  app "peazip.app", target: "PeaZip.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "/Applications/PeaZip.app"]
  end

  caveats <<~EOS
    You may need to run the following command to use PeaZip.app (*):
      xattr -dr com.apple.quarantine /Applications/peazip.app
  EOS
end
