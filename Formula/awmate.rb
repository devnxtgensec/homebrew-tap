class Awmate < Formula
  desc "AWMate (Assistive Workmate) - the coding agent CLI"
  homepage "https://awmate.nxtgensec.org"
  version "2.2.49"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.49/awmate-cli-darwin-arm64"
      sha256 "053c3df07fd7634a175b8f65f00d1f5eecf256ccb9f84065190cbd08598d3e3f"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.49/awmate-cli-darwin-x64"
      sha256 "69007bfefd52eae08145a2c1aff32815db8fc09b244c0825f2741705194a17f1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.49/awmate-cli-linux-arm64"
      sha256 "6a19144af0e6bd628c2339d61d6712521d05309665e2edee665ab188fcf5c384"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.49/awmate-cli-linux-x64"
      sha256 "96e912c5640afea4b45b64d9c085f5006e730b47dc6328fc38536da1ef719132"
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
