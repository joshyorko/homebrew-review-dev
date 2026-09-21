class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260921010100"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260921010100-386fa6315f5f/bluefin-review-dev-aarch64.tar.gz"
    sha256 "53c1a50836aa5779075707efaed7e71ce5c8edc520b3a4862517e2d3cf1104ed"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260921010100-386fa6315f5f/bluefin-review-dev-x86_64.tar.gz"
    sha256 "e3513517a3ea5637e7b8684ed75218cf5390a11cad10b04ffc3a21e2e4c0a722"
  end
  def install
    libexec.install "launcher", "build.json", "build.txt"
    bin.install "bluefin"
    bin.install_symlink libexec/"launcher/bin/bluefin-contribute"
  end
  test do
    assert_match "Usage: bluefin", shell_output("#{bin}/bluefin 2>&1", 2)
    assert_predicate libexec/"launcher/bluefin-review.sif", :executable?
  end
end
