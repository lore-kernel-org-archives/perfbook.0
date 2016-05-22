Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=MvPpjAAN556aMGHgPSYdgl+RcBIFvtHo1IZMJMFV9Dk=;
 b=kl5W+RyRnwNszMsQlLmxm5JrS04XCuy3pfxPmAEpxDz/p6xKpKA5ijtQiWhRM5CrtD
 JPu+0ar0YG0cn7RKiTL3tup2/7aXR63I/YJZsPpd1ioDBVwa8DNRK3DRlq/PUKy+elgd
 kB10MJYvEAT0VnjXSrhcHCDAl9QmhigVxXlYQ7idRxGz4JADFb/p3B/tSQGRY18E3Kij
 XPY9YISj9sxeWXSP417KYYyxMNp7z2HjqNh5el7kDHrawHhBGUcykCv6lnshKBw2eWhw
 oMwEnhbuJmoqs8zOV6D3lkoKyvIJ+Vaou8SUjgVghNs+wJcpaD49vbpTVPHpJz1AdgJH
 FwRQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] cpu: Add citation of HP11
Message-ID: <9cd19ab1-37ce-b528-fddc-919e88a21bfc@gmail.com>
Date: Sun, 22 May 2016 12:57:44 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From ffbc919394b33fd71a2ee0203083b0d7388d541d Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 5 May 2016 11:59:04 +0900
Subject: [PATCH] cpu: Add citation of HP11

Latest edition of Hennessy and Patterson's "Computer Architecture"
is Fifth edition (2011). This commit adds a citation of it in
Chapter 3.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/hw.bib  | 7 +++++++
 cpu/cpu.tex | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/bib/hw.bib b/bib/hw.bib
index 943206a..4c3f418 100644
--- a/bib/hw.bib
+++ b/bib/hw.bib
@@ -74,6 +74,13 @@ year="1992"
 ,publisher="Morgan Kaufman"
 }

+@Book{Hennessy2011
+,author="John L. Hennessy and David A. Patterson"
+,title="Computer Architecture, Fifth Edition: A Quantitative Approach"
+,year="2011"
+,publisher="Morgan Kaufman"
+}
+
 @Book{DavidECuller1999
 ,author="David E. Culler and Jaswinder Pal Singh and Anoop Gupta"
 ,title="Parallel Computer Architecture: a Hardware/Software Approach"
diff --git a/cpu/cpu.tex b/cpu/cpu.tex
index 04cca00..b9c7ef2 100644
--- a/cpu/cpu.tex
+++ b/cpu/cpu.tex
@@ -15,7 +15,7 @@ within a shared-memory system.
 These few pages can do no more than scratch the surface of shared-memory
 parallel hardware design; readers desiring more detail would do well
 to start with a recent edition of Hennessy and Patterson's classic
-text~\cite{Hennessy95a}.
+text~\cite{Hennessy2011,Hennessy95a}.

 \QuickQuiz{}
 	Why should parallel programmers bother learning low-level
-- 
1.9.1

