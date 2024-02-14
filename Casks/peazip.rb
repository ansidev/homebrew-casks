# https://peazip.github.io/changelog.html
cask "peazip" do
  arch arm:   "aarch64",
       intel: "x86_64"

  version "9.7.0"
  sha256 arm:   "3ee26aa5fd7b1a113c2753bf2cdfa75657b299f41c67361e7112d4a178d9c6bf",
         intel: "39c3af6d9fdc2a283d6e9af56a877fa3e2121c2ebe9a395e09264749f158225a"

  url "https://github.com/peazip/PeaZip/releases/download/#{version}/peazip-#{version}.DARWIN.#{arch}.dmg",
      verified: "github.com/peazip/PeaZip/"
  name "PeaZip"
  desc "Free file archiver utility"
  homepage "https://peazip.github.io/"

  livecheck do
    url "https://github.com/peazip/PeaZip"
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
