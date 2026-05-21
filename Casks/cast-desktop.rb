cask "cast-desktop" do
  version "1.2.5"
  sha256 "0060ee8c545f75abe3df3d576df1ea9d8630c68c2f510faf036f9ca92237eeae"

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
