cask "zedha" do
  version "1.12.0-zedha.1"
  sha256 "0f3c3d6e795e6e1f91bd4ce1158f40e0133eac95609b3655a07aed35f9e979b8"

  url "https://github.com/rnretirwtsohg/zedha/releases/download/v#{version}/Zedha-aarch64.dmg"
  name "Zedha"
  desc "Personal-first downstream distribution of the Zed editor"
  homepage "https://github.com/rnretirwtsohg/zedha"

  depends_on arch: :arm64

  app "Zedha.app"
  binary "#{appdir}/Zedha.app/Contents/MacOS/cli", target: "zedha"

  zap trash: [
    "~/Library/Application Support/Zedha",
    "~/Library/Caches/Zedha",
    "~/Library/Logs/Zedha",
    "~/Library/Preferences/me.ghostwriternr.Zedha.plist",
    "~/Library/Saved Application State/me.ghostwriternr.Zedha.savedState",
  ]
end
