class Prank < Formula
  desc "A multiple alignment program for DNA, codon and amino-acid sequences"
  homepage "http://wasabiapp.org/software/prank/"
  url "http://wasabiapp.org/download/prank/previous_version/prank.source.140603.tgz"
  sha256 "9a48064132c01b6dba1eec90279172bf6c13d96b3f1b8dd18297b1a53d17dec6"
  # tag origin homebrew-science
  # tag derived

  depends_on "ensembl/external/biopp"
  depends_on "ensembl/external/mafft"
  depends_on "ensembl/external/exonerate22"

  def install
    cd "src" do
      system "make"
      bin.install "prank"
      man1.install "prank.1"
    end
  end

  test do
    system "#{bin}/prank", "-help"
  end
end
