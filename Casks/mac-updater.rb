# https://www.corecode.io/macupdater/history3.html
cask "mac-updater" do
  version "3.3.0"
  sha256 :no_check

  url "https://www.corecode.io/downloads/macupdater_latest.dmg"
  name "Mac Updater"
  desc "Keep all your apps up-to-date effortlessly"
  homepage "https://www.corecode.io/macupdater"

  livecheck do
    url "https://www.corecode.io/macupdater/history3.html"
    strategy :page_match do |page|
      page.scan(/(\d+\.\d+\.\d+)/i)
          .map { |match| match&.first }
    end
  end

  auto_updates true

  app "MacUpdater.app", target: "MacUpdater.app"
end
