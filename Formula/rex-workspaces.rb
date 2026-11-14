class RexWorkspaces < Formula
  desc "Start, stop and restart project workspaces in Rex"
  homepage "https://github.com/agarun/rex-workspaces"
  version "0.2.1"

  base = "https://github.com/agarun/rex-workspaces/releases/download/v#{version}"
  on_macos do
    on_arm do
      url "#{base}/rex-workspaces-aarch64-apple-darwin.tar.gz"
      sha256 "39b287dbc26a949914d1ebb35885fec1546948bf84b691cdd8e865af1d4dc07b"
    end
    on_intel do
      url "#{base}/rex-workspaces-x86_64-apple-darwin.tar.gz"
      sha256 "ab61e5ee280ff2162f9a4491da9c716abe7926c9f6a47b11058d9ae16e1a2800"
    end
  end
  on_linux do
    on_arm do
      url "#{base}/rex-workspaces-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4e66e5daddf2658e1a6dcb3e66e004f368b5651e4005018b962ce71cd855d3e1"
    end
    on_intel do
      url "#{base}/rex-workspaces-x86_64-unknown-linux-musl.tar.gz"
      sha256 "70ce6b368a2809f391c1be45f7a38ab08799faa76bac2995d213c36eb02a3b5a"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/rex-workspaces"
  end

  def caveats
    <<~EOS
      To add rex-workspaces to Rex, run:
        rex-workspaces install
      Before brew uninstall, run:
        rex-workspaces uninstall
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rex-workspaces --version")
    assert_path_exists libexec/"init.lua"
  end
end
