class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260924202218"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260924202218-c5a6cd4b8985/bluefin-review-dev-aarch64.tar.gz"
    sha256 "b3aca32cb6b090e51013cef0d7ca4d009efa3b06847bef63bec54da3ecfd6010"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260924202218-c5a6cd4b8985/bluefin-review-dev-x86_64.tar.gz"
    sha256 "664ad23ee8b9067fbe5fedada5f608e6f701ceeec69f338c4dd985729d0672ea"
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
