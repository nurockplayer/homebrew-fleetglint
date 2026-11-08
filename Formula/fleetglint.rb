class Fleetglint < Formula
  include Language::Python::Virtualenv

  desc "Local, read-only board for people who run many AI agents and models at once"
  homepage "https://github.com/nurockplayer/tachiko-fleetglint"
  url "https://github.com/nurockplayer/tachiko-fleetglint/releases/download/v0.1.1/fleetglint-0.1.1.tar.gz"
  sha256 "13875b62edd414b7b23c2fc18af0d4376f695355dda638905c5bb56cee8f576e"
  license "MIT"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  service do
    run [opt_bin/"fleetglint", "serve"]
    keep_alive true
    log_path var/"log/fleetglint.log"
    error_log_path var/"log/fleetglint.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fleetglint version")
  end
end
