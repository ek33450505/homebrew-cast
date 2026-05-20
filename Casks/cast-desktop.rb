cask "cast-desktop" do
  version "1.2.1"
  sha256 "870b832dac5070eee8d191a149c02a78826b9e44eef8c5842f1173ddbb94b146"

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
