Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E5536CDEB
	for <perfbook@vger.kernel.org>; Wed,  6 May 2026 11:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778067784; cv=none; b=hOYkVDDvTK15JPTDhTNY7wuattG3bBJ470/xOUpfTmyuzybgh7x6a6QC5/zlqEgDouyiqt30CqLDB8TSo2Qw4/c/rx34pqF3zjjHEVbqNFtYn02JUiSIXOkCBpf1JSzt5TmLK2D3otKI8bjuYw7rWJxc8HM2fuKiZGc41os5guo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778067784; c=relaxed/simple;
	bh=TQxK7/WDWQjaDZk5qyqQUspYyAQ9Y4kFAIySBOTKPi8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k3idMbeMoyz3PxnBGn7dR8YOg5qnTp0CEoynhUrHylsLkByL1SMI02YJIms78lbX9adx8MgSja90qeinIe0pWKFY+JB4tWM7mLoFC4GJPLTmp0U1/cHWD4CMSMxL2xjwF55V50bay0OMjGmrLhZ8fKdm3VtuzFGW1e2p8eEOaEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rhd4Kr+9; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rhd4Kr+9"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-365d4d2f9c1so143769a91.1
        for <perfbook@vger.kernel.org>; Wed, 06 May 2026 04:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778067782; x=1778672582; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qkheTw/SE/Gl8VSf8QKxWpeJr2xAMhm+z9cc8NtxazA=;
        b=rhd4Kr+9Du2WlRaF/HRXcqwY+g36JkYGMRpY1P6401akk7zRLeoTAHDK+fZSlqIbn7
         F3uEBhC1oeC+YeFbiQWNrVsAuof/F38TsBzRViUmHkVuhD79nQ/gigj/8U5Wsp8gb0g7
         WB0j3NX0rsR63pDiqWuXqcVYPYmTYEbWtpEyfSMXZB3wE9rE1RNiOMG2xMAEtXXLotZk
         pSoj/JjKgpss+uKzxK5GIGOQeyrkG9Z0ZIwFXI/Z7A/0wJ79P6dMyirCaJAhxpz7rMZ0
         xrH2smtDDJAkFrr+6IHrz5np7cvY3ZweL22q0XVsjfQerLsaOEBeMWeGvG0FmeSTosz4
         vS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778067782; x=1778672582;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qkheTw/SE/Gl8VSf8QKxWpeJr2xAMhm+z9cc8NtxazA=;
        b=fz2qCr41CxmscrGrSnHzkLdfwfZ5pz/Q5wPv82gSMHiqwsoejyCHgbSoxouceKtJ5J
         et5XeUSMFewjBf9IRp0qK6PSy5HyuAPiQP8+sv5nx2U2QkxlzzhejJBZS+KBaVcHKay5
         39kWDorrFDnwsDS9pXbxS2nkS4jXxD83/SIcf7zsq/1VNUMfAAwmti/r+qPyuExPjJuI
         HVmQ1OfLjpBjY+JZadCoMOUhm9sSaqrp0pfECFvcLFbPiO0zof0pozjDOd21z/Jqqq9d
         O8nZPlx6pzwD676KpidlgY9lhXSq6Sa/Owf3apA5xFJW8tL5O4JnLmfokAbB0IYvW9PA
         JvaA==
X-Gm-Message-State: AOJu0YyYmfQm1TmQnjHbHggNuXrg+22I7HKgRk/ASfxCSNzd8q39XSRv
	BIs7nRGw/ADbjoyVNClcg4+WfcLBgfScSD9S0Nrn/hp6rWTXrqVVYZBw
X-Gm-Gg: AeBDieurooVSwQI5pb+eEz/cu0sYozQ20GtvtOkxytXVTLV9SOBRSwbylZX2QrYQJzB
	AVObfl80PfnQJQypICK2qX1Hm9jSbRUax7yd/dZ2UTWzbzGvJBIbZiKMRNMJVnewVZln0SaeNlW
	gq+BAg91Axf+qUGBQ3wkot1BX+2VsDw/Wyj6PVqcvsiM2qFox29zi2/a6P11TkU8WHgDZAwR1Hv
	4Wh1Qs51iiNR9xHxG0AXNennWy6Jtdnno7lzaTaST6l76vZwsNGnD8n672pyfU4A0MopV78xhjn
	c9Y+/dhD5B61hk85tAEtCMTcpDzk8ZDQVk8574pQTcZAwgVLx/rrbdfHZu6ADS961Icoc0vY1IC
	hmXhpc6E8nGdGgo+XujVukYjhJSuXuVRP16uzT5k/HKeMmTpmNUtulmRissCFt8hYQ5AVVLVCMR
	2JIQyQkL22i/SHWbVE8MYWpNVe2t3AEA3vmgbVG7NwwngHowm/7Wa8Y6l5LEoQ0K6PKOqrJ5MJL
	Iers/8=
X-Received: by 2002:a17:90b:3e86:b0:365:5c58:79ef with SMTP id 98e67ed59e1d1-365ac79179amr3019878a91.27.1778067782005;
        Wed, 06 May 2026 04:43:02 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b06b6f12sm1040471a91.5.2026.05.06.04.43.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 04:43:01 -0700 (PDT)
Message-ID: <afadddc8-714f-483d-8359-1b3640ee37e4@gmail.com>
Date: Wed, 6 May 2026 20:43:03 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 4/8] precheck-tentative.sh: Detect premature
 versions of "lineno" and "microtype"
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <e8b6b390-7034-4d01-a565-8d5d48309a05@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <e8b6b390-7034-4d01-a565-8d5d48309a05@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

LaTeX2e "<2025-06-01> Patch Level 1" and later changed the way
output hooks are applied to column/page breaks.
As a result, loading pre-v5.7 lineno.sty breaks chapter/section
titles printed in the header area of twocolumn builds.
lineno.sty v5.7 has restored compatibility with recent LaTeX2e
releases and v5.9 has fixed its regression of potential infinite
loop [1].

hyperref.sty has made a change in a way it loses compatibility
with microtype.sty <v3.2c [2].

Unfortunately, Ubuntu LTS (26.04) and Fedora 44 were released
with such premature versions at their initial releases.

As a tentative measure, add a script named precheck-tentative.sh,
which detects said premature packages and suggests their upgrades.

Link: https://ctan.org/ctan-ann/id/aa3GMRDWA8OxUAGc@prptp [1]
Link: https://github.com/schlcht/microtype/issues/64 [2]
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile                        |  1 +
 utilities/precheck-tentative.sh | 66 +++++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100755 utilities/precheck-tentative.sh

diff --git a/Makefile b/Makefile
index a72b4794..b4f34c51 100644
--- a/Makefile
+++ b/Makefile
@@ -297,6 +297,7 @@ endif
 ifeq ($(LATEX_CMD),)
 	$(error LaTeX engine "$(LATEX)" not found.)
 endif
+	LATEX=$(LATEX) sh utilities/precheck-tentative.sh
 	LATEX=$(LATEX) sh utilities/runfirstlatex.sh $(basename $@)
 
 autodate.tex: $(LATEXSOURCES) $(BIBSOURCES) $(LST_SOURCES) \
diff --git a/utilities/precheck-tentative.sh b/utilities/precheck-tentative.sh
new file mode 100755
index 00000000..8b53e02c
--- /dev/null
+++ b/utilities/precheck-tentative.sh
@@ -0,0 +1,66 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# Check buggy LaTeX packages observed in distro TeX Live as of April 2026.
+#
+# Copyright (C) Akira Yokosawa, 2026
+
+KPSEWHICH=`command -v kpsewhich`
+
+if [ "$KPSEWHICH" != "" ] ; then
+
+#### Is lineno.sty too young for LaTeX2e ?
+# LaTeX2e <2025-06-01> and later needs lineno.sty v5.7 or later.
+# This is a minor incompatibility observed only in twocolumn builds.
+#
+#   Symptom: chapter & section titles in header area are broken.
+
+lineno_sty=`kpsewhich lineno.sty`
+lineno_ver=`grep -F '\def\fileversion' $lineno_sty | \
+	sed -E -e 's/.*\{(v[0-9\.]+)\}.*$/\1/'`
+LINENO_AT_LEAST=v5.7
+linenosince=`env printf "$LINENO_AT_LEAST\n$lineno_ver" | sort -V | head -n 1`
+
+latex_release=`kpsewhich latexrelease.sty`
+latex_ver=`grep -F -A1 -e '\edef\latexreleaseversion' $latex_release | \
+	grep -F '{' | \
+	sed -E -e 's/[ ]+\{([0-9\-]+)\}/<\1>/' -e 's/\//\-/g'`
+
+LATEX_SINCE="<2025-06-01>"
+latexsince=`env printf "$LATEX_SINCE\n$latex_ver" | sort | head -n 1`
+
+if [ "$latexsince" = "$LATEX_SINCE" ] ; then  # older
+    if [ "$linenosince" != "$LINENO_AT_LEAST" ] ; then
+	echo "lineno.sty $lineno_ver is too young for LaTeX2e $latex_ver."
+	echo "Upgrade lineno.sty to at least v5.7."
+        echo "Treat this as a minor issue and continue building nonetheless."
+    fi
+fi
+
+#### Is microtype.sty too young for recent hyperref (>=v7.01p) ?
+
+microtype_sty=`kpsewhich microtype.sty`
+microtype_ver=`grep -F -A2 -e '\ProvidesPackage' $microtype_sty | \
+	grep -F '[' | \
+	sed -E -e 's/[ ]+\[[0-9\/]+ (v[0-9a-z\.]+)/\1/'`
+
+MICROTYPE_AT_LEAST="v3.2c"
+microtypesince=`env printf "$MICROTYPE_AT_LEAST\n$microtype_ver" | sort -V | head -n 1`
+
+hyperref_sty=`kpsewhich hyperref.sty`
+hyperref_ver=`grep -F -A1 -e '\ProvidesPackage{hyperref}' $hyperref_sty | \
+	grep -F '[' | sed -e 's/%//' | \
+	sed -E -e 's/[ ]+\[[0-9\/\-]+ (v[0-9a-z\.]+)[ ]+/\1/'`
+
+HYPERREF_SINCE="v7.01p"
+hyperrefsince=`env printf "$HYPERREF_SINCE\n$hyperref_ver" | sort -V | head -n 1`
+
+if [ "$hyperrefsince" = "$HYPERREF_SINCE" ] ; then  # older
+    if [ "$microtypesince" != "$MICROTYPE_AT_LEAST" ] ; then
+	echo "microtype.sty $microtype_ver is too young for hyperref.sty $hyperref_ver."
+	echo "Upgrade microtype.sty to at least $MICROTYPE_AT_LEAST."
+        echo "Treat this as a minor issue and continue building nonetheless."
+    fi
+fi
+
+fi  #KPSEWHICH
-- 
2.43.0


