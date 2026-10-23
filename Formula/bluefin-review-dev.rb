class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20261023173437"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261023173437-418e0dd5b421/bluefin-review-dev-aarch64.tar.gz"
    sha256 "ab706f84c6e18fbbe6861bd391b3892492c14f96e0ef682e22cabcecc0e1aea3"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261023173437-418e0dd5b421/bluefin-review-dev-x86_64.tar.gz"
    sha256 "c4dd19882f980a10088ab9e6b607bd1ab11d506dae40cfdb971b3f6fbc61cb19"
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
