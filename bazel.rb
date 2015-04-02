class Bazel < Formula
  homepage "http://bazel.io"
  head "https://github.com/google/bazel.git"

  depends_on :java => "1.8+"
  depends_on "libarchive"
  depends_on "protobuf"

  def install
    ENV.prepend_path "PATH", "#{HOMEBREW_PREFIX}/bin"
    system "bash ./compile.sh"
    bin.install Dir["output/bazel"]
  end
end
