class Cast < Formula
  desc "Multi-agent framework for Claude Code"
  homepage "https://github.com/ek33450505/claude-agent-team"
  url "https://github.com/ek33450505/claude-agent-team/archive/refs/tags/v8.0.0.tar.gz"
  sha256 "9389bce429d9bb9dcf0af22e9285508ea379a550402ccc0e16d79aee65407a88"
  license "MIT"

  depends_on "python"

  def install
    # Install the full repo to libexec so the cast binary can resolve
    # VERSION, agents/, scripts/, etc. relative to itself
    libexec.install Dir["*"]

    # Symlink the cast CLI into PATH
    bin.install_symlink libexec/"bin/cast"

    # Shell completions
    zsh_completion.install libexec/"completions/_cast"
    bash_completion.install libexec/"completions/cast.bash"
  end

  def caveats
    <<~EOS
      CAST CLI is installed. To set up the full framework (agents, hooks, scripts) into ~/.claude/:

        bash #{libexec}/install.sh

      After install:
        cast status        # health dashboard
        cast doctor        # validate your setup

      Docs: https://github.com/ek33450505/claude-agent-team
    EOS
  end

  test do
    assert_match "8.0.0", shell_output("#{bin}/cast --version")
  end
end
