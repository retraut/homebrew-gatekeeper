class Gatekeeper < Formula
  desc "Service authentication status monitor with daemon, CLI, and tmux integration"
  homepage "https://github.com/retraut/gatekeeper"
  license "MIT"
  version "v0.7.3"

  on_macos do
    on_arm do
      url "https://github.com/retraut/gatekeeper/releases/download/v0.7.3/gatekeeper-darwin-arm64"
      sha256 "9eb58d64a3e0d38746feb6cb8d5a81c129160874934f66cb5ad1294e6d993f5a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/retraut/gatekeeper/releases/download/v0.7.3/gatekeeper-linux-arm64"
      sha256 "d6d0693857a22565db36586d0d17d1248bed749769d2ffa6ec119fe2079bd46e"
    end
    on_intel do
      url "https://github.com/retraut/gatekeeper/releases/download/v0.7.3/gatekeeper-linux-amd64"
      sha256 "5473ca22e116ad9abc8543ac28e870208d8635839e11ecb3aa5a168e8a4ca6cd"
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
