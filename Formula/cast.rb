class Cast < Formula
  desc "Multi-agent framework for Claude Code"
  homepage "https://github.com/ek33450505/claude-agent-team"
  url "https://github.com/ek33450505/claude-agent-team/archive/refs/tags/v9.1.0.tar.gz"
  sha256 "4cec93d98bde294131f9840f1d1925b32f08a5f82514f008daa8b2f424770271"
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
    assert_match "9.1.0", shell_output("#{bin}/cast --version")
  end
end
