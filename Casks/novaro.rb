cask "novaro" do
  name "novaro"
  desc "The NovaroPay command-line tool"
  homepage "https://github.com/novaro-pub/novaro-cli"
  version "0.1.1"

  livecheck do
    skip "Auto-generated on release."
  end

  binary "novaro"

  on_macos do
    on_intel do
      url "https://github.com/novaro-pub/novaro-cli/releases/download/v0.1.1/novaro_0.1.1_darwin_amd64.tar.gz"
      sha256 "08cdfd0016ada8b11c621aa940531b1b05d4bed25c8bc2472558016d353ea6a5"
    end
    on_arm do
      url "https://github.com/novaro-pub/novaro-cli/releases/download/v0.1.1/novaro_0.1.1_darwin_arm64.tar.gz"
      sha256 "0d6e9f377c6722d9297532534cf88b151e7d7c9546062f8dc269e687cc4575af"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/novaro-pub/novaro-cli/releases/download/v0.1.1/novaro_0.1.1_linux_amd64.tar.gz"
      sha256 "a7f587674479e3184c7ecf436931247ce7201a11889f9f5856fed4552fb96a46"
    end
    on_arm do
      url "https://github.com/novaro-pub/novaro-cli/releases/download/v0.1.1/novaro_0.1.1_linux_arm64.tar.gz"
      sha256 "eca26047eed14401167d774a6c59d4bed3b6eb670d956f76f1f556ff5820ef75"
    end
  end

  postflight do
    # The binary is not notarized: let macOS run it.
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/novaro"]
    end
  end
end
