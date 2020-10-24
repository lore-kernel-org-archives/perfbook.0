Return-Path: <SRS0=L/E8=D7=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=w8Xn3R+qmu6mWysCA/eAs+fqSVxhSBGVUGRrdsyP44U=;
        b=li+vx2y7Vn40+dtkH1kagg8u/9DBoWSELQnzo2tOKBFxt3UO/UNgmNfUeWOxRLUHXA
         RSCajrOOhKJQju230efGJbpm+wUrbx8XpYHNlCpt/D77cWgE/VaKvN7tTWYemG7c7AIW
         DXqF/raZXDyzNh5sxe4ztbcLZQRPBqCq6pK0mphq8w5w9+rq9LCO93EiVtnsE7TPLpRy
         Egrner2XKEvebqDhvR1fZaJ4Uidkd5ltG/hWcV5Di7y85hnMsaq5IAdfftKEexKKBtvB
         V5CiTPmnrQmQ5Pg1tG5J5nO3i84oVi33x2eI+n9KRklO7HSX4TkcNcIZo1uihBVysXew
         VugQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH perfbook] utilities/autodate.sh: Make newer tcolorbox behave
 as before
Message-ID: <b120d0b6-0c03-f1c6-7e2e-bea2e28227ce@gmail.com>
Date: Sat, 24 Oct 2020 20:39:18 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Date: Sun, 4 Oct 2020 18:57:55 +0900
Subject: [PATCH perfbook] utilities/autodate.sh: Make newer tcolorbox behave as before

tcolorbox 4.40 or later has wider skips around its boxes by default.

Putting \tcbsetforeverylayer{autoparskip} in preamble restores the
previous default behavior [1].

It needs to be put conditionally because the command changes older
tcolorbox's behavior.

We use a lot of booleans for conditional things in perfbook, but
their values are changed based on targets such as -1c, -nq, -qq, etc.
However, version of tcolorbox is common to all the targets.
We need a different way to put the \tcbsetforeverylayer{} command.

As autodate.tex is included in the preamble of perfbook, we can do
this by adding some script in autodate.sh, which will generate the
command when a newer tcolorbox is found.

Also update Makefile to let autodate.tex depend on autodate.sh.

[1]: https://www.ctan.org/ctan-ann/id/mailman.3088.1601153860.2548.ctan-ann@ctan.org

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

I have kept this one on hold for a couple of weeks.
perfbook can be built without this change, but the wider skips
around Quick Quizzes looked waste of space for me.

This change actually restores the exact behavior of older tcolorbox.

        Thanks, Akira
--
 Makefile              |  2 +-
 utilities/autodate.sh | 10 ++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index a3f98442..73b5767e 100644
--- a/Makefile
+++ b/Makefile
@@ -204,7 +204,7 @@ ifeq ($(NEWTXTEXT),)
 endif
 	sh utilities/runfirstlatex.sh $(basename $@)
 
-autodate.tex: perfbook-lt.tex $(LATEXSOURCES) $(BIBSOURCES) $(SVGSOURCES) $(FIGSOURCES) $(DOTSOURCES) $(EPSORIGIN) $(SOURCES_OF_SNIPPET) $(GITREFSTAGS) utilities/fcvextract.pl
+autodate.tex: perfbook-lt.tex $(LATEXSOURCES) $(BIBSOURCES) $(SVGSOURCES) $(FIGSOURCES) $(DOTSOURCES) $(EPSORIGIN) $(SOURCES_OF_SNIPPET) $(GITREFSTAGS) utilities/fcvextract.pl utilities/autodate.sh
 	sh utilities/autodate.sh >autodate.tex
 
 perfbook_flat.tex: autodate.tex $(PDFTARGETS_OF_EPS) $(PDFTARGETS_OF_SVG) $(FCVSNIPPETS) $(FCVSNIPPETS_VIA_LTMS)
diff --git a/utilities/autodate.sh b/utilities/autodate.sh
index 2b76d33b..7bd7cbb8 100644
--- a/utilities/autodate.sh
+++ b/utilities/autodate.sh
@@ -94,3 +94,13 @@ env printf '\\date{%s %s, %s %s %s}\n' $month $day $year "$release" $modified
 env printf '\\newcommand{\\commityear}{%s}\n' $year
 env printf '\\newcommand{\\commitid}{%s}\n' $commitid$modified
 env printf '\\IfQqzBg{}{\\setboolean{qqzbg}{%s}}\n' $qqzbg
+
+# command for newer tcolorbox (4.40 or later) to have backward-compatible skips
+tcolorbox_sty=`kpsewhich tcolorbox.sty`
+tcbversion=`grep ProvidesPackage $tcolorbox_sty | sed -e 's/.*version \([0-9]\+\.[0-9]\+\).*/\1/g'`
+tcbold=4.39
+env printf '%% tcolorbox version: %s\n' $tcbversion
+if [ $(echo $tcbversion $tcbold | awk '{if ($1 > $2) print 1;}') ] ;
+then
+	env printf '\\tcbsetforeverylayer{autoparskip}\n';
+fi
-- 
2.17.1

