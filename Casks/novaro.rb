cask "novaro" do
  name "novaro"
  desc "The NovaroPay command-line tool"
  homepage "https://github.com/novaro-pub/novaro-cli"
  version "0.1.0"

  livecheck do
    skip "Auto-generated on release."
  end

  binary "novaro"

  on_macos do
    on_intel do
      url "https://github.com/novaro-pub/novaro-cli/releases/download/v0.1.0/novaro_0.1.0_darwin_amd64.tar.gz"
      sha256 "77151fb57df3c44777695e1fd4d83a32d36154cf0ce6a978b297e37c7d4430c9"
    end
    on_arm do
      url "https://github.com/novaro-pub/novaro-cli/releases/download/v0.1.0/novaro_0.1.0_darwin_arm64.tar.gz"
      sha256 "12b48993dd6060d5c32abadb7cded3d52f6c168ad696b2fab5ef0add6e8f6024"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/novaro-pub/novaro-cli/releases/download/v0.1.0/novaro_0.1.0_linux_amd64.tar.gz"
      sha256 "2f5f2073a62eb49e10158cbbcdcffa85a5c2403f62cfb1454752f1ee9cc9f86e"
    end
    on_arm do
      url "https://github.com/novaro-pub/novaro-cli/releases/download/v0.1.0/novaro_0.1.0_linux_arm64.tar.gz"
      sha256 "ca1d9aa44494a37df7323f29dcd8c1418e0995b6bfe1757c3fe4b1ab062ecb11"
    end
  end

  postflight do
    # The binary is not notarized: let macOS run it.
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/novaro"]
    end
  end
end
