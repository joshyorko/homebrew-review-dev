class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260916170305"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260916170305-891f1837886e/bluefin-review-dev-aarch64.tar.gz"
    sha256 "1c3ccf29a0e3dca71f026bfdb50d03c3f9b2346ad944f99d50087b78b4b985e3"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260916170305-891f1837886e/bluefin-review-dev-x86_64.tar.gz"
    sha256 "03b06393a8ce1a39a290bb5afa654777d333db4cadbed525cb3d0e3e10bed4e2"
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
