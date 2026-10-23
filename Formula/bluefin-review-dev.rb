class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20261023183506"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261023183506-cfa11a1fa788/bluefin-review-dev-aarch64.tar.gz"
    sha256 "365a49949d031ae6e44d7dc2550f90089dc46cb38aed3baf414a747f26ad4d33"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261023183506-cfa11a1fa788/bluefin-review-dev-x86_64.tar.gz"
    sha256 "c75327ddc9e180679a9ffa64026049bc5d292136a6f66a0d9865cc9c0250434d"
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
