class Sourcekitten < Formula
  desc "Framework and command-line tool for interacting with SourceKit"
  homepage "https://github.com/jpsim/SourceKitten"
  url "https://github.com/jpsim/SourceKitten.git", :tag => "0.7.3", :revision => "0ed186552d8f9f3e128ab382581102c55c2d3c73"
  head "https://github.com/jpsim/SourceKitten.git"

  bottle do
    cellar :any
    sha256 "611d38fec07962c583b82a5ce8eb39da8f42480dea627eee5cb595de3422742b" => :el_capitan
    sha256 "bbbfd50e74119af775ed85a0c09fae339d2468710850827fb4c06349dba0bd9e" => :yosemite
  end

  depends_on :xcode => ["7.1", :build]

  def install
    system "make", "prefix_install", "PREFIX=#{prefix}", "TEMPORARY_FOLDER=#{buildpath}/SourceKitten.dst"
  end

  test do
    system "#{bin}/sourcekitten", "syntax", "--text", "import Foundation // Hello World"
  end
end
