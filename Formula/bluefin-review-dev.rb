class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260928205854"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260928205854-77745ab51016/bluefin-review-dev-aarch64.tar.gz"
    sha256 "9ab3ff370abcfaeadf45b447e5d1914daa7fffc5e7c9640b84ca4cd150080431"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260928205854-77745ab51016/bluefin-review-dev-x86_64.tar.gz"
    sha256 "2bcb2bd61cf62e3cf5e47ce15baeda12f1e7e85d2afa074f65116b2fb46e60f6"
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
