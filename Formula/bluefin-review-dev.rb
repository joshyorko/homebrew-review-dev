class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20261002153100"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261002153100-7ba06b600828/bluefin-review-dev-aarch64.tar.gz"
    sha256 "b15bab80a6f0fa3b267015872f369cf8a50205d3c327bb51cc8ff34970f70c07"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261002153100-7ba06b600828/bluefin-review-dev-x86_64.tar.gz"
    sha256 "bd096c736a37f8dc5ea101f1e29bd594e168eac440775f1be67566be34b48f77"
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
