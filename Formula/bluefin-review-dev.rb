class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20261001162649"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261001162649-a066286c8707/bluefin-review-dev-aarch64.tar.gz"
    sha256 "6602d7a79413de323b42cd9e1aa96e042e105506598a08829909394561b70d98"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261001162649-a066286c8707/bluefin-review-dev-x86_64.tar.gz"
    sha256 "241e9313b943bd9fa1a819be4c006122b2d00cd28b04f9d2a9c1b5bdb4e9db7d"
  end
  def install
    libexec.install "launcher", "build.json", "build.txt"
    bin.install "bluefin"
  end
  test do
    assert_match "Usage: bluefin", shell_output("#{bin}/bluefin 2>&1", 2)
    assert_predicate libexec/"launcher/bluefin-review.sif", :executable?
  end
end
