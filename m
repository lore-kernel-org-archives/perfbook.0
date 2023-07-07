Return-Path: <SRS0=XIzw=CZ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688731759; x=1691323759;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4T7GA/KFypaCnGG2wBVID5gKyeDfsgTmicRrLVJCWQY=;
        b=qNuZKx82iFvF2+iEhslstHx79ab9QfUr4F7iiIrvlCX1Sd9fSF7QKl6wWCmcSeNbjn
         nta14PzqwhTzg6bHrjYahEQWvCwmHwN5N1oj5htzu5UNXcFh41BoVoa56Xfzh1xS7+DH
         6AGww0FZygqw1VZSaHm5Vke4Kz6pWW4C0lUuLPBR3RZuCAIHY6HYZP00z8SgPua+wL0H
         Kf6PPtGkpomQ3qAwfhIHjHgB1f624WIjWR4z2I03ioSV5gtjfRmXBDO/mPToOJFSOCcc
         weMWDayZSE+S+UAWR5CDNvN9C/O1mik4zbRtXTN0mZ6rtJa2NESKSTrppE7FMdbdqYUX
         ZDQw==
Message-ID: <54e5b9d0-354c-4663-d37f-67134ad38206@gmail.com>
Date: Fri, 7 Jul 2023 21:09:17 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 4/7] Silence font warning in sf (sans serif) builds
Content-Language: en-US
References: <fcac2844-3c91-c6d1-d921-5402eead1cfc@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <fcac2844-3c91-c6d1-d921-5402eead1cfc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

There are a couple of warnings in sf (sans serif) builds:

    LaTeX Font Warning: Font shape `T1/qhv/m/sl' in size <7.3> not available
    (Font)              Font shape `T1/qhv/m/it' tried instead on input line 367.

This is because the qhv (Helvetica clone) font family doesn't
provide slanted shape to be used in the header area of the page
(chapter and section title) and LaTeX uses its italic shape as a
fallback.

This is OK as italic and slanted shapes would look mostly the same
for sans-serif font families.

Suppress the warning by using the silence package.

Giving "save" option to silence makes it save filtered-out warnings
in $basename.sil.  This is better than discarding silenced warnings.

Add $basename.sil to .gitignore and Makefile's "clean" target.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 .gitignore      | 1 +
 Makefile        | 1 +
 perfbook-lt.tex | 4 ++++
 3 files changed, 6 insertions(+)

diff --git a/.gitignore b/.gitignore
index 1604a4d8c5b1..fa20ccb5de94 100644
--- a/.gitignore
+++ b/.gitignore
@@ -45,6 +45,7 @@ autodate.tex
 /perfbook*.gls
 /perfbook*.glsdefs
 /perfbook*.ist
+/perfbook*.sil
 extraction
 embedfonts
 CodeSamples/snippets.d
diff --git a/Makefile b/Makefile
index 6a389089e38c..bffdd2da1f4d 100644
--- a/Makefile
+++ b/Makefile
@@ -597,6 +597,7 @@ clean:
 	rm -f perfbook*.idx perfbook*.ind perfbook*.ilg perfbook*.ist
 	rm -f perfbook*.acn perfbook*.acr perfbook*.alg
 	rm -f perfbook*.glg perfbook*.glo perfbook*.gls perfbook*.glsdefs
+	rm -f perfbook*.sil
 	rm -f CodeSamples/snippets.d
 	rm -f *.synctex*
 	@rm -f $(OBSOLETE_FILES) $(EPSSOURCES_TMP)
diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 842e0fc6b924..fdfde1953225 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -330,6 +330,10 @@
 \renewcommand{\familydefault}{\sfdefault}
 \normalfont
 \usepackage[slantedGreek,scaled=.96]{newtxsf}
+% Silence inevitable warnings on missing slanted shape
+\RequirePackage[save]{silence}
+\WarningFilter[sansslant]{latexfont}{Font shape `T1/qhv/m/sl'}
+\ActivateWarningFilters[sansslant]
 }{
 \usepackage[slantedGreek]{newtxmath} % math package to be used with newtxtext
 % Poor person's slanted shape for roman --- newtxtext lacks slanted shape
-- 
2.25.1


