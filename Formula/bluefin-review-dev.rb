class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260914191758"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260914191758-df75555e77a4/bluefin-review-dev-aarch64.tar.gz"
    sha256 "b3d787394b5778972846b9a0af63c2b136ca675587ef2f75cfa6779989dd965f"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260914191758-df75555e77a4/bluefin-review-dev-x86_64.tar.gz"
    sha256 "0b556d4b0dc9ba75db23a001bb5183603a8b918d39bb9a6f9230740e56ff3508"
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
