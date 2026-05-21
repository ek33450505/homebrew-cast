cask "cast-desktop" do
  version "1.2.6"
  sha256 "ca9bf1d541107c1239d4c69b23c83c6ceca78047a1d37bc36a0592630654f7a6"

  url "https://github.com/ek33450505/cast-desktop/releases/download/v#{version}/Cast-Desktop-aarch64-darwin.tar.gz"
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
