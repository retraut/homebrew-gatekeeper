class Gatekeeper < Formula
  desc "Service authentication status monitor with daemon, CLI, and tmux integration"
  homepage "https://github.com/retraut/gatekeeper"
  license "MIT"
  version "v0.8.0"

  on_macos do
    on_arm do
      url "https://github.com/retraut/gatekeeper/releases/download/v0.8.0/gatekeeper-darwin-arm64"
      sha256 "771ea3952bbbcecbce847a4c3b7b1e709354667e2c138f21a8c08702e16a5b34"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/retraut/gatekeeper/releases/download/v0.8.0/gatekeeper-linux-arm64"
      sha256 "a05d5b2b3f13364e6966e06228d859f1f369f173633e469e5b51ac5a849b12e4"
    end
    on_intel do
      url "https://github.com/retraut/gatekeeper/releases/download/v0.8.0/gatekeeper-linux-amd64"
      sha256 "f7717dad79086de5aad5d32f23ee4f9337e17109000f2a23a2551a1057b0eed4"
    end
  end

  def install
    arch = if Hardware::CPU.arm?
             "arm64"
           else
             "amd64"
           end

    os_name = if OS.mac?
                "darwin"
              elsif OS.linux?
                "linux"
              else
                "unknown"
              end

    binary_name = "gatekeeper-#{os_name}-#{arch}"
    bin.install binary_name => "gatekeeper"
  end

  test do
    system "#{<built-in function bin>}/gatekeeper", "--help"
  end
end
