class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20261020151407"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261020151407-06bd3e6f41fd/bluefin-review-dev-aarch64.tar.gz"
    sha256 "2bb889bdd5ebef2b376ecc5d834f8fa7cb2dbe0c935619a0930280224965ec49"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261020151407-06bd3e6f41fd/bluefin-review-dev-x86_64.tar.gz"
    sha256 "212051a602d8b7806088766943e5fbf8b07937c939cb6d46da854057b274f9b3"
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
