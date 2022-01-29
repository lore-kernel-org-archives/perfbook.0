Return-Path: <SRS0=PE5W=SN=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ubdnfEtucMSqdDkGmxq/Nx+be5t5l7Z1WUv92xGhk10=;
        b=neg/agVgXHVxLZwy3X9GUFuW2kHpeTG6wEfk5dpGIRGBd/zbClQ3Ooq8u71YmlGDIb
         bfeU04QT0ojrm/j/Y+28dpqoKt+tIkLmSVKhNOa5IvMJSUGoUK0eHVYN3foisVZZvd9I
         U2SmUplIcUlCRF5gnMUvyKn948YkDw4M9DZjB43Ijry0YrevgufzVtKCHrdzn0bZyblW
         helbaBLfj2Qw7vv8wRU4Lc2w7ydIKETJFdxOoWpAQxvUUp61ll0c4aT8O6jt7dN8rnNO
         XshgbsXECRX7g+1H8zYqvhe9YjC0sOIfLN8mdPgK1J5ga4fGMACefNG+hHA/6OV/MPWe
         HwmQ==
Message-ID: <9952aa9f-36a4-4bbb-ba14-cd004e6c46db@gmail.com>
Date: Sat, 29 Jan 2022 20:28:46 +0900
MIME-Version: 1.0
Subject: [RFT PATCH -perfbook v3 v3 4/4] Add script for parallel-pdflatex-run
 regression test
Content-Language: en-US
References: <e4f48e3d-7efe-f822-1002-6836d63b542f@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <e4f48e3d-7efe-f822-1002-6836d63b542f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

utilities/parallel-latex-regress.sh runs three phases of
"make -j$JOBS $TARGETS" with SyncTeX option enabled.

    Phase 1: Sequential pdflatex runs by Makefile.2022.01.25
    Phase 2: Sequential pdflatex runs by Makefile
    Phase 3: Parallel pdflatex runs by Makefile

It then compares collected SyncTeX databases and prints out the
result.

Default values of variables TARGETS, JOBS, TMP, and REFMAKE can be
overridden by saying, e.g.:

    TARGETS="ix 1cix ebix" ./utilities/parallel-latex-regress.sh

Target names given to TARGETS are not sanity-checked at the moment.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/parallel-latex-regress.sh | 75 +++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100755 utilities/parallel-latex-regress.sh

diff --git a/utilities/parallel-latex-regress.sh b/utilities/parallel-latex-regress.sh
new file mode 100755
index 00000000..9bc6f860
--- /dev/null
+++ b/utilities/parallel-latex-regress.sh
@@ -0,0 +1,75 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+#
+# Regression test of parallel pdflatex runs.
+# Copyright (C) Akira Yokosawa, 2022
+#
+# Authors: Akira Yokosawa <akiyks@gmail.com>
+
+TARGETS=${TARGETS:-2c 1c eb}
+JOBS=${JOBS:-4}
+TMP=${TMP:-/tmp}
+REFMAKE=${REFMAKE:-make -f Makefile.2022.01.25}
+export LATEX_OPT=-synctex=1
+
+copy_synctex_db () {
+	for t in $TARGETS
+	do
+		case $t in
+			2c ) base=perfbook;;
+			*  ) base=perfbook-$t;;
+		esac
+		cp $base.synctex.gz $TMP/$base.$1.synctex.gz
+	done
+}
+
+# Reference sequential builds
+
+$REFMAKE neatfreak
+$REFMAKE -j$JOBS perfbook_flat.tex
+$REFMAKE $TARGETS
+
+copy_synctex_db ref
+
+# Sequential builds
+
+make neatfreak
+make -j$JOBS perfbook_flat.tex
+make $TARGETS
+
+copy_synctex_db sequ
+
+# Parallel builds
+
+make neatfreak
+make -j$JOBS $TARGETS
+
+copy_synctex_db para
+
+cmp_err=0
+
+for t in $TARGETS
+do
+	case $t in
+		2c ) base=perfbook;;
+		*  ) base=perfbook-$t;;
+	esac
+
+	if ! cmp $TMP/$base.ref.synctex.gz $TMP/$base.sequ.synctex.gz
+	then
+		cmp_err=`expr $cmp_err + 1`
+	fi
+	if ! cmp $TMP/$base.ref.synctex.gz $TMP/$base.para.synctex.gz
+	then
+		cmp_err=`expr $cmp_err + 1`
+	fi
+done
+
+if test $cmp_err -eq 0
+then
+	echo "No mismatch detected in SyncTeX databases."
+	exit 0
+else
+	echo "Mismatch detected in SyncTeX databases!"
+	exit 1
+fi
-- 
2.17.1


