class Cast < Formula
  desc "Multi-agent framework for Claude Code"
  homepage "https://github.com/ek33450505/claude-agent-team"
  url "https://github.com/ek33450505/claude-agent-team/archive/refs/tags/v10.9.1.tar.gz"
  sha256 "b6c632efeb5db1c4f697c36dc23c8570d36f7c7916809a25a93ddbad050f073f"
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
    assert_match "10.9.1", shell_output("#{bin}/cast --version")
  end
end
