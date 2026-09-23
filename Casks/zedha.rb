cask "zedha" do
  version "1.21.0-zedha.1"
  sha256 "ac89739df157c8350f100020fe54591a24cc0fcb82a8d1f353914660512cbe1d"

  url "https://github.com/rnretirwtsohg/zedha/releases/download/v#{version}/Zedha-aarch64.dmg"
  name "Zedha"
  desc "Personal-first downstream distribution of the Zed editor"
  homepage "https://github.com/rnretirwtsohg/zedha"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Zedha stable builds do not self-update; Homebrew owns the update lifecycle.
  depends_on arch: :arm64

  app "Zedha.app"
  binary "#{appdir}/Zedha.app/Contents/MacOS/cli", target: "zedha"

  generate_completions_from_executable "#{HOMEBREW_PREFIX}/bin/zedha", "--completions",
                                       shells: [:bash, :zsh, :fish, :pwsh]

  # The release is unsigned. The pinned SHA-256 verifies the artifact before
  # this app-specific quarantine exception is applied on install and upgrade.
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Zedha.app"]
  end

  uninstall quit: "me.ghostwriternr.Zedha"

  zap trash: [
    "~/.config/zedha",
    "~/.local/state/Zedha",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/me.ghostwriternr.zedha.sfl*",
    "~/Library/Application Support/Zedha",
    "~/Library/Caches/me.ghostwriternr.Zedha",
    "~/Library/Caches/Zedha",
    "~/Library/HTTPStorages/me.ghostwriternr.Zedha",
    "~/Library/Logs/Zedha",
    "~/Library/Preferences/me.ghostwriternr.Zedha.plist",
    "~/Library/Saved Application State/me.ghostwriternr.Zedha.savedState",
  ]
end
