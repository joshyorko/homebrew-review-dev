class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260913190354"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260913190354-2fabdb985ef2/bluefin-review-dev-aarch64.tar.gz"
    sha256 "48ca2750b8806a1745d0c1d9828a5b00743f8643994f4b52ee5447719c303dd5"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260913190354-2fabdb985ef2/bluefin-review-dev-x86_64.tar.gz"
    sha256 "75343e39c3049384780121b2fb2747afe99a27319edd79c095240ca3f7ec3d9f"
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
