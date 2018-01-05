class Bwa062 < Formula
  desc "Burrow-Wheeler Aligner for pairwise alignment of DNA"
  homepage "https://github.com/lh3/bwa"
  # doi "10.1093/bioinformatics/btp324"
  # tag "bioinformatics"
  # tag origin homebrew-science
  # tag derived

  url "https://github.com/lh3/bwa.git", :using => :git, :revision => '0.6.2'
  version '0.6.2'

  keg_only 'bwa 0.6.2 creates binaries with the same name as all other bwa installs'
  
  def install
    inreplace 'Makefile', '-g -Wall -O2', '-std=gnu89 -g -Wall -O2'
    system "make"
    bin.install "bwa"
    man1.install "bwa.1"
  end

  test do
    (testpath/"test.fasta").write ">0
AGATGTGCTG
"
    system "#{bin}/bwa", "index", "test.fasta"
    assert File.exist?("test.fasta.bwt")
    system "#{bin}/bwa", "aln", "-f", "test.bwa", "test.fasta", "test.fasta"
    system "#{bin}/bwa", "samse", "-f", "test.sam", "test.fasta", "test.bwa", "test.fasta"
    assert File.exist?("test.sam");
  end
end
