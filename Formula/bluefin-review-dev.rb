class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260921030911"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260921030911-ccd941192b48/bluefin-review-dev-aarch64.tar.gz"
    sha256 "e8276ef335b719e72062909c311f0037ea58d4c7abce4878afe78c64478e3214"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260921030911-ccd941192b48/bluefin-review-dev-x86_64.tar.gz"
    sha256 "784d80ab35bbc667b5fc0ed0527fb26d6f504b13e2bf3d64cfe8e64bc64e265c"
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
