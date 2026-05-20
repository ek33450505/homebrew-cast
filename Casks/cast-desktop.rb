cask "cast-desktop" do
  version "1.2.1"
  sha256 "840d4705650f918aee773dfe38ea93e54408f4eb95ddda18e9191ad92ff1170d"

  url "https://github.com/ek33450505/cast-desktop/releases/download/v#{version}/Cast.Desktop_#{version}_aarch64.dmg"
  name "Cast Desktop"
  desc "The desktop app for CAST — every agent signal in one window"
  homepage "https://github.com/ek33450505/cast-desktop"

  app "Cast Desktop.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Cast Desktop.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.cast-desktop",
    "~/Library/Logs/cast-desktop",
  ]
end
