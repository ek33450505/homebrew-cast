cask "cast-desktop" do
  version "1.2.0"
  sha256 "0b08248eb7bbb856dbfb77f44291febc8ba23d7e600f9f2c6ca74d9624ecfdde"

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
