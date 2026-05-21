cask "cast-desktop" do
  version "1.2.3"
  sha256 "fdefb65e481240fefa9df2e1a24e0c88a77907f152f76e92f3ff68278e07c0e3"

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
