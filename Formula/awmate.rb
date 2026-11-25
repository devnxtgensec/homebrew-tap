class Awmate < Formula
  desc "AWMate (Assistive Workmate) - the coding agent CLI"
  homepage "https://awmate.nxtgensec.org"
  version "2.2.63"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.63/awmate-cli-darwin-arm64"
      sha256 "ab084a7323dd39e4d23f1a799a18e84ee3e366bdb533e3c82d45c4fa45ddd365"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.63/awmate-cli-darwin-x64"
      sha256 "b020208c074e227eabffd351abf81d5db47cca17c2772d3141db1da294646dc8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.63/awmate-cli-linux-arm64"
      sha256 "5fbbbd7c133646760fdfc694b6c1f9aa77a14e89517152bd095fe35cfa85ba1b"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.63/awmate-cli-linux-x64"
      sha256 "4cc2b60f877f56c445cbfc0b27e44bc4118af140687ee4c0d13934fc569972a0"
    end
  end

  def install
    bin.install "awmate-cli-darwin-arm64" => "awmate" if OS.mac? && Hardware::CPU.arm?
    bin.install "awmate-cli-darwin-x64" => "awmate" if OS.mac? && Hardware::CPU.intel?
    bin.install "awmate-cli-linux-arm64" => "awmate" if OS.linux? && Hardware::CPU.arm?
    bin.install "awmate-cli-linux-x64" => "awmate" if OS.linux? && Hardware::CPU.intel?
  end

  def caveats
    <<~EOS
      Run 'awmate' once to sign in and start your daily free usage.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/awmate --version")
  end
end
