Return-Path: <SRS0=gYOr=7K=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679183197;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PO8rTsJYXHuKuLbhVbULZ1PNUaZ/yWyT0sj50I9HOII=;
        b=pgyW/TsABaUDFHnSQ/bYCcr3sm08cypb/oQlVJmdcABkpbAi/OAVmmU/fODyNBMZmf
         xTh2oPNDQL01xSAVs5UIx0sGcJNEn5EO8LsYDyeYZYbt3g+ffFprj1LE0r7cIWu++a3f
         VTRBTbPlG5x45IaIHNzTS2BSt7Sk5Yv/cpGgDVVQNheoxJZVsb2ymsY+b3/TvZMlLnAW
         5yjtKI1wsu6mKst+RtNqHQJfP6p1vqMTSzVNi25+X28BZrfQrgG0ycU1cUzxH+UDeeU/
         9R46AN6gzNzWn+kYWK5Iq97MgbTtzqU8hhFmhEm0QhXPoPQcP2jsMwgzPqYAZIqR2pVF
         UzJw==
Message-ID: <6af94801-148c-b5a9-5629-95ce08d8e6fa@gmail.com>
Date: Sun, 19 Mar 2023 08:46:33 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 3/3] parallel-latex-regress.sh: Pass WHICH=which to
 reference Makefile
Content-Language: en-US
References: <475eb10b-a10c-a3ec-0651-b122f00bdff0@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <475eb10b-a10c-a3ec-0651-b122f00bdff0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Commit fbcd7ed25527 ("Stop using 'which' command in build scripts")
broke utilities/parallel-latex-regress.sh due to the missing
definition of WHICH in epstopdf-rule.mk and a2ping-rule.mk.

Resolve this by adding "WHICH=which" to the option list passed to
the reference Makefile.

Note:
    "which" should be the command for reference builds.

Fixes: Commit fbcd7ed25527 ("Stop using 'which' command in build scripts")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/parallel-latex-regress.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utilities/parallel-latex-regress.sh b/utilities/parallel-latex-regress.sh
index 9bc6f8600f22..2e8904ce3b03 100755
--- a/utilities/parallel-latex-regress.sh
+++ b/utilities/parallel-latex-regress.sh
@@ -9,7 +9,7 @@
 TARGETS=${TARGETS:-2c 1c eb}
 JOBS=${JOBS:-4}
 TMP=${TMP:-/tmp}
-REFMAKE=${REFMAKE:-make -f Makefile.2022.01.25}
+REFMAKE=${REFMAKE:-make -f Makefile.2022.01.25 WHICH=which}
 export LATEX_OPT=-synctex=1
 
 copy_synctex_db () {
-- 
2.25.1


