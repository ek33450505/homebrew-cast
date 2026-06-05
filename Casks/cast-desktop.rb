cask "cast-desktop" do
  version "1.2.12"
  sha256 "e0113cfbe9f1b527e7dcb31a7795e2999adb1f9cea97008b3db10e94b0a3128d"

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
    "~/Library/Application Support/com.cast-desktop.app",
    "~/Library/Logs/cast-desktop",
  ]
end
