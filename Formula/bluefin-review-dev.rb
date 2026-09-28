class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260928192147"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260928192147-8b2ae1ec166f/bluefin-review-dev-aarch64.tar.gz"
    sha256 "3b7f1c3fcbe287b0da93a45f6745b3ab0e4a652e00d98f4d08569d6fa4b4420e"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260928192147-8b2ae1ec166f/bluefin-review-dev-x86_64.tar.gz"
    sha256 "234d584b88036a35caac01154517eb93b6cd93d984de0a0f00101e49c6f6a01a"
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
