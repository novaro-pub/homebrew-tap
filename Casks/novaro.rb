cask "novaro" do
  name "novaro"
  desc "The NovaroPay command-line tool"
  homepage "https://github.com/novaro-pub/novaro-cli"
  version "0.1.2"

  livecheck do
    skip "Auto-generated on release."
  end

  binary "novaro"

  on_macos do
    on_intel do
      url "https://github.com/novaro-pub/novaro-cli/releases/download/v0.1.2/novaro_0.1.2_darwin_amd64.tar.gz"
      sha256 "25bf46c426481ad92a7067f305c7aad8ac01d22ffa9954829377d4ec654ac707"
    end
    on_arm do
      url "https://github.com/novaro-pub/novaro-cli/releases/download/v0.1.2/novaro_0.1.2_darwin_arm64.tar.gz"
      sha256 "f246e2206f05253c6dd1ca6dc7e64f1eeae7273190707ccc8c378465364e64bd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/novaro-pub/novaro-cli/releases/download/v0.1.2/novaro_0.1.2_linux_amd64.tar.gz"
      sha256 "58c08d09f22729fb6acde69a410f9b0bd614e1c278e9bed880a7199133d3112e"
    end
    on_arm do
      url "https://github.com/novaro-pub/novaro-cli/releases/download/v0.1.2/novaro_0.1.2_linux_arm64.tar.gz"
      sha256 "bd5b632a86b5f78dded5e66144ee8b71be9e1179c33a2eb97b2be5350e7c9f0f"
    end
  end

  postflight do
    # The binary is not notarized: let macOS run it.
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/novaro"]
    end
  end
end
