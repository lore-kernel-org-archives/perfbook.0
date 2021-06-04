Return-Path: <SRS0=cMq3=K6=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=owubCNTHhrFdgOv3L46D436ueyjc9bFg66BRhG8yb0U=;
        b=ppVtybOicJUTtcsyJ3thNbMWEFdZyHYmy0hogmTxyZIIVFgTNYuqMvnIuIfjeNORN6
         52FboNWnJY60a137YTsvkDd9/JgI/mcf8B3bNBuR/u++3TISq2GPLZAqoJ9OaVyweaPS
         U/GiM0lPhLUPo+64yf+tvnc+XaPnqA/c2bGQ3wcyYckzCYJ3vVGsYUAr0JXPWz8IBm8Z
         kP94UEL9tWZppDIpluljM2H4XHwGF6f5PTOcWUTA2ejEZ/9dSdTpdck3CfUkRMRae8at
         VSUN1zzhJUZuMd48911VtCM1uSWaMeDxuPQGwxjG9XR1S1VymaeNvq6N4LAi76no0GEW
         NNag==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] FAQ-BUILD: Remove items of obsolete issues on
 Fedora
Message-ID: <4d932040-16ac-74b3-688b-9a40721525b5@gmail.com>
Date: Fri, 4 Jun 2021 11:59:22 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Also indent answer to (now) #12 in the same manner as the other
answers.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ-BUILD.txt | 47 ++++++++---------------------------------------
 1 file changed, 8 insertions(+), 39 deletions(-)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index 3672d4f2..80b71c42 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -38,7 +38,7 @@
 	A.	The "pdflatex" package is a variant of Don Knuth's
 		digital typesetting program, which you can install.
 		Alternatively, you can use the container image described
-		in #14 below.  Otherwise, instructions follow.
+		in #13 below.  Otherwise, instructions follow.
 
 		On Ubuntu Bionic and Focal, the following list should cover
 		necessary packages (except for -doc packages):
@@ -240,47 +240,16 @@
 		Please make sure to revert the changes before doing
 		"git commit" of the other updates you've made.
 
-12.	Figures of gnuplot in perfbook I built have their upper end
-	trimmed.  What am I missing?
-
-	A.	This is a known issue on Fedora as of November 2, 2019.
-		Its Ghostscript (9.27) has regression in bounding box
-		calculation. It has been fixed since in the upstream
-		Ghostscript.
-
-		    https://bugs.ghostscript.com/show_bug.cgi?id=700988
-
-		Installing upstream Ghostscript 9.50 (or later) should
-		work with you, but see #7 above to get a compatible a2ping.
-
-		"make neatfreak; make" will rebuild all the figures.
-		The "-jN" option should accelerate the rebuild.
-
-	    Note:
-		Fedora 32 has a fixed version of Ghostscript (9.52).
-
-13.	After updating or installing texlive packages on Fedora,
-	build fails with the message from bibtex saying:
-
-		I found no \bibdata command---while reading file perfbook.aux
-		I found no \bibstyle command---while reading file perfbook.aux
-
-	Is there any workaround?
-
-	A.	Try rebuilding database files by the following commands:
-
-		    sudo updmap-sys --syncwithtrees --force
-		    sudo updmap-sys
-
-14.	After upgrading the userspace RCU library, and all of the code
+12.	After upgrading the userspace RCU library, and all of the code
 	samples making use of that library are now broken.
 
-	The userspace RCU library sometimes breaks ABI, which requires
-	that the binaries dynamically linking to it be rebuilt.
-	Try removing the old binaries ("make clean") and then rebuilding
-	("make").
+	A.	The userspace RCU library sometimes breaks ABI, which
+		requires that the binaries dynamically linking to it be
+		rebuilt.
+		Try removing the old binaries ("make clean") and then
+		rebuilding ("make").
 
-15.	I want a stable environment to build perfbook.pdf.
+13.	I want a stable environment to build perfbook.pdf.
 	Can't I just use some container image?
 
 	A.	You can find a template Dockerfile under the docker/
-- 
2.17.1

