Return-Path: <SRS0=xvZ9=NM=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=rk17EJQJ29YFZUQCrlFdc5wf2AIBxZvRcn4OEFR/T50=;
        b=G9kEf4HwZCX+05HGQzlwoB9bXmC70gy8G81raqIGYLKEOsFZgps9ucwo6kvdOoBonZ
         S3OWaaI1m4aaDNrf8rKeFUS5uryKjnIsIsfXvP+CAHWagKUA703HXWgvBb+W3VG/G45o
         3snu+rG20JXDOKYIfIqc47E/s8uVhg2vppfg4/XnJ09dGdce0V3blobCjNsB3zRSbsS4
         VajEqs34AOvLM7o2paNTFlGevWvIOJ3bMusvuigK6NqXiKL5/obD9GO5hCuE4wUhH0+D
         mrV2kx+dBpjo2iY1fTW4gf+aA7TaivxXPqvdHjHkzcv2YA5v+q3SFzpqB+PzhK+rVZZy
         D79A==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] sytleguide: Upgrade references to NIST style guide
 as bibliography
Message-ID: <5de06cfa-b092-4a98-ae2b-056fd4404d8b@gmail.com>
Date: Sat, 21 Aug 2021 11:07:16 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

The NIST style guide was referenced as URL links in footnotes.
Those links got broken due to the update of SI standards in 2019.

Fix this by adding proper BiBTeX entries in standard.bib and citing them.
Also make NIST's other cheat sheets and JEDEC's "mega as a prefix to units"
dictionary page as bibliography entries.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

I put the bib entries in standards.bib, which might or might not
be the right place.
If you have more suitable place in mind, please let me know.

        Thanks, Akira
--
 appendix/styleguide/styleguide.tex | 20 ++++++-------------
 bib/standards.bib                  | 31 ++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 14 deletions(-)

diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index e980cb5c..d23207ac 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -98,10 +98,8 @@ Following is a convention regarding punctuation in \LaTeX\ sources.
 \subsubsection{SI Unit Symbol}
 \label{sec:app:styleguide:SI Unit Symbol}
 
-NIST style guide\footnote{
-  \url{https://www.nist.gov/pml/nist-guide-si-chapter-7-rules-and-style-conventions-expressing-values-quantities}}
+NIST style guide~\cite[Chapter 5]{NIST:SP:330:2019}
 states the following rules (rephrased for perfbook).
-% cite: https://www.nist.gov/pml/nist-guide-si-chapter-7-rules-and-style-conventions-expressing-values-quantities
 
 \begin{itemize}
 \item When SI unit symbols such as ``ns'', ``MHz'', and ``K'' (kelvin)
@@ -156,8 +154,8 @@ Example:
 Strictly speaking, NIST guide requires us to use the binary prefixes
 ``Ki'', ``Mi'', or ``Gi'' to represent powers of~$2^{10}$.
 However, we accept the JEDEC conventions to use ``K'', ``M'',
-and ``G'' as binary prefixes in describing memory capacity.\footnote{
-  \url{https://www.jedec.org/standards-documents/dictionary/terms/mega-m-prefix-units-semiconductor-storage-capacity}}
+and ``G'' as binary prefixes in describing memory
+capacity~\cite{JEDEC:dict:prefixmega}.
 
 An acceptable example:
 \begin{quote}
@@ -210,9 +208,7 @@ symbols.
 \subsubsection{Font Style}
 \label{sec:app:styleguide:Font Style}
 
-Quote from NIST check list:\footnote{
-  \#6 in \url{https://physics.nist.gov/cuu/Units/checklist.html}
-}
+Quote from NIST check list~\cite[\#6]{NIST:UnitCheckList}:
 
 \begin{quote}
   Variables and quantity symbols are in italic type.
@@ -228,9 +224,7 @@ For example,
 \end{quote}
 
 On the other hand, mathematical constants such as the base
-of natural logarithms should be roman.\footnote{
-  \url{https://physics.nist.gov/cuu/pdf/typefaces.pdf}
-}
+of natural logarithms should be roman~\cite{NIST:TypeFaces}.
 For example,
 
 \begin{quote}
@@ -250,9 +244,7 @@ Other English conventions are followed in such cases.
 \subsubsection{Digit Grouping}
 \label{sec:app:styleguide:Digit Grouping}
 
-Quote from NIST checklist:\footnote{
-  \#16 in \url{https://physics.nist.gov/cuu/Units/checklist.html}.
-}
+Quote from NIST checklist~\cite[\#16]{NIST:UnitCheckList}:
 
 \begin{quote}
   The digits of numerical values having more than four digits on either
diff --git a/bib/standards.bib b/bib/standards.bib
index 7edb988a..dc29ebc3 100644
--- a/bib/standards.bib
+++ b/bib/standards.bib
@@ -47,3 +47,34 @@
 \url{http://www.open-std.org/jtc1/sc22/wg14/www/docs/n2443.pdf}
 [Viewed January 26, 2020]",
 }
+
+@techreport{NIST:SP:330:2019,
+  author={{National Institure of Standards and Technology}},
+  title={The International System of Units {(SI)}},
+  institution={U.S. Department of Commerce},
+  address={Washington, D.C.},
+  number={NIST Special Publication 330 2019 EDITION},
+  DOI={10.6028/NIST.SP.330-2019},
+  year={2019},
+}
+
+@webpage{JEDEC:dict:prefixmega,
+  author={{JEDEC}},
+  title={mega {(M)} (as a prefix to units of semiconductor storage capacity)},
+  url={https://www.jedec.org/standards-documents/dictionary/terms/mega-m-prefix-units-semiconductor-storage-capacity},
+  lastchecked={August 20, 2021},
+}
+
+@webpage{NIST:UnitCheckList,
+  author={{National Institure of Standards and Technology}},
+  title={{SI Unit} rules and style conventions},
+  url={https://physics.nist.gov/cuu/Units/checklist.html},
+  lastchecked={August 20, 2021},
+}
+
+@webpage{NIST:TypeFaces,
+  author={{National Institure of Standards and Technology}},
+  title={{Typefaces for Symbols in Scientific Manuscripts}},
+  url={https://physics.nist.gov/cuu/pdf/typefaces.pdf},
+  lastchecked={August 20, 2021},
+}
-- 
2.17.1

