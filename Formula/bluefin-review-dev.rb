class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20261016185828"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261016185828-53413f240149/bluefin-review-dev-aarch64.tar.gz"
    sha256 "0826a83391ca72e160059fb88e39e9156b46a6d09f2ea24c902d9dac95606ddd"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261016185828-53413f240149/bluefin-review-dev-x86_64.tar.gz"
    sha256 "395b5def7e4e56ccaa1f2da86dc210135e7ebd569984f08577a098a267f19586"
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
