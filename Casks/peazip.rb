# https://peazip.github.io/changelog.html
cask "peazip" do
  arch arm:   "aarch64",
       intel: "x86_64"

  version "9.8.0"
  sha256 arm:   "5fba1cc7f69f1a445e7fea04fbf07e28e23189d7ba301451da3d49368e6c77c1",
         intel: "ccb608ea543ba29dc6b992537d144475ab21f68ec03abd8a78b728cf0aaebf5e"

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

  caveats <<~EOS
    You may need to run the following command to use PeaZip.app (*):
      xattr -dr com.apple.quarantine /path/to/appdir/peazip.app
  EOS
end
