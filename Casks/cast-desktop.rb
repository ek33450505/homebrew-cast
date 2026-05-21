cask "cast-desktop" do
  version "1.2.8"
  sha256 "aaff2dd150d6411eae51e2b8939a396402c14f6e7ae87cc28a1968b10ae2a75c"

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
