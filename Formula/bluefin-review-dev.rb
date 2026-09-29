class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260929210757"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260929210757-5fb744890672/bluefin-review-dev-aarch64.tar.gz"
    sha256 "434ccf53e1ea3ccbc184ec9e69d6e784d2deeb0ec9147a37eb2aa7c90c41b887"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260929210757-5fb744890672/bluefin-review-dev-x86_64.tar.gz"
    sha256 "760e7567bbdcdbdf3e1d93602d6475234d3557994825a0e4b9d471b87c64a8f4"
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
