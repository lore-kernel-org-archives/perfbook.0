Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=tWewC/mB5ASVzP7ozkLgnw4JmReUol9EKUUl8bHIeEc=;
 b=bLRDqjvx33QqIl+Gg1TKeynaWa9UpIsi0xRZYy22nhmBji/OX6+AQScdMxtBi2STaz
 LW8jBuCSmqMSCA+6/ymr7Vvn1BpcOndv5o5+Y+IH6AB2/Fj1hoYPNIW+MNTQ2lh6bqbZ
 raKn8HJvY5k+qAckQnP9nMlEgRjkVByfuD6ml/WfhVkhRH1mujOUTGZemXL9UHPyWW8G
 h6Xj7aw68e0UUJetdg+mJIY7F0+i+nPir+MLM8+O+rC+7kfSEs9HhxYPXegehGnnZ2PX
 9NOcRLWfHirKEuZFEQ9IKnYdOUfkIn0kG4nf2tjK4a6H0UxzbmmqsuP0sigLOTDEjM1A
 Uk6Q==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] FAQ-BUILD.txt: Append reference to manual LaTeX package
 install
Message-ID: <d4e3f6ba-bdc9-fa85-7404-f189adfb6436@gmail.com>
Date: Thu, 23 Mar 2017 22:03:29 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 4452298c139d3af3abb5af1d1a3a40754851e0b6 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 23 Mar 2017 21:47:58 +0900
Subject: [PATCH] FAQ-BUILD.txt: Append reference to manual LaTeX package install

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

So, this is the update of FAQ-BUILD.txt.
Feel free to wordsmith as you like before pushing out.

                                     Thanks, Akira
--
 FAQ-BUILD.txt | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index 6627bbb..4a4d8fb 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -34,7 +34,7 @@
 	find it?

 	A.	The "pdflatex" package is a variant of Don Knuth's
-		digital typesetting program.  On Ubuntu Trusty,
+		digital typesetting program.  On Ubuntu Trusty and Xenial,
 		installing the following set of packages suffices:

 			texlive-latex-base texlive-latex-extra psutils
@@ -83,3 +83,34 @@
 		so if it happens, please let me know.  Please send me the
 		perfbook.log output (or perfbook-1c.log output, depending
 		on which you were building) so that I can fix the scripts.
+
+8.	Some of experimental targets for alternative font won't build
+	due to lack of necessary packages such as "newtxtt". How can I
+	install those packages?
+
+	A.	Simple answer would be "Upgrade to a recent TeX
+		distribution such as TeX Live 2016".
+		Upgrading Linux distribution (e.g. to Ubuntu Xenial)
+		would be another option.
+		If you want to manually install individual packages,
+		refer to "Method 3" in:
+
+			http://tex.stackexchange.com/questions/73016/
+
+		For font packages such as "newtxtt" and "nimbus15",
+		you also need to update font-map database. See:
+
+			http://tex.stackexchange.com/questions/88423/
+
+		Note: If available, <package>.tds.zip would relieve you
+		from figuring out where to put unpacked files. Also,
+		font packages should be copied to TEXMFLOCAL rather than
+		TEXFMHOME.
+
+		Following is a list of links to optional packages as of
+		March 2017:
+
+			https://www.ctan.org/pkg/newtxtt
+			https://www.ctan.org/pkg/nimbus15
+			https://www.ctan.org/pkg/inconsolata
+			https://www.ctan.org/pkg/mathastext
-- 
2.7.4

