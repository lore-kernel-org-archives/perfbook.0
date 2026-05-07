Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05DA19992C
	for <perfbook@vger.kernel.org>; Thu,  7 May 2026 09:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778147472; cv=none; b=UPBKagiglB6SLOF2S4guHzMK4yzBUDcSooA8VSA4qeL0EUidCoFwKsEMgqkog4B+Brd52Gz90RJYHv/DA0M//M7SKBH158CKf218EsAHTYE9xfbrq3jJLacgWFaIj0Oq7jUh0fMbpTkS10QILGQv+baBBIDoX/ZVqwoPkPyNsz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778147472; c=relaxed/simple;
	bh=QE2k/OhHEVDoCBkjufeEEyidJ5A+TlPjexKT/RSmv+w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MxXKK5VEIA6PgkHx+Kzkbjl++8vHq4d7tJMIJ84CYh8loVlQH0rgooDZBAwiDyBR3uQXd/t8ATmCiGcmSbTH1Lg9mvczI9Kn5ttBXGrd+8yHHPd6a41MV59tF40ZViThT2X2qvwb3IeiRGf5cfxtN7NjDEQPkZuapckqXloEPO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ConmWniZ; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ConmWniZ"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778147467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cbp6kgfaYzLs07sXgXAVIxkmjyp2TRwJuwEuYTH2ZNk=;
	b=ConmWniZIIYtnjFlK7mNn0zVPbDVVDpdvAZCquuhB6ndy1Xu4EFQM7qAKiB91nBJlg4/qZ
	obiuJt2eUy5+uQRYTUUqmmh2NKum3vREBvFeTg3bf70bWPkI8HwHKQDEeRPlS0z5SypwbY
	ExABmmABRfOoupAawJSMVOWMFmeuRmk=
From: Kunwu Chan <kunwu.chan@linux.dev>
To: perfbook@vger.kernel.org
Cc: Kunwu Chan <kunwu.chan@linux.dev>,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [PATCH] precheck-tentative.sh: Make array.sty probing fail-fast and deterministic
Date: Thu,  7 May 2026 17:50:11 +0800
Message-Id: <20260507095011.1551131-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On systems where kpsewhich cannot resolve array.sty, the script fed an
empty path into the version-parsing pipeline and then compared an empty
array_req_ver against latex_ver in the non-pdflatex-dev path. The
result depended on environment and produced no actionable error.

This is reproducible by overriding kpsewhich to return nothing for
array.sty while keeping other lookups intact.

Add a guard before parsing array.sty, set array_req_ver only when the
file exists, fail fast with a clear diagnostic when it does not, and
correct the warning text typo ("arary.sty" -> "array.sty").

Fixes: 4cad3dd1174a ("precheck-tentative.sh: Fail early with suggestions for Fedora 44")

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 utilities/precheck-tentative.sh | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/utilities/precheck-tentative.sh b/utilities/precheck-tentative.sh
index 96d2fe2f..1e106877 100755
--- a/utilities/precheck-tentative.sh
+++ b/utilities/precheck-tentative.sh
@@ -77,15 +77,24 @@ if [ "$latex_release_dev" != "" ] ; then
 fi
 
 array_sty=`kpsewhich array.sty`
-array_req_ver=`grep -F -e '\NeedsTeXFormat{LaTeX2e}' $array_sty | \
-	tail -n 1 | \
-	sed -e 's/\\\\NeedsTeXFormat{LaTeX2e}//' | \
-	sed -E -e 's/\[/</' -e 's/\]/>/' -e 's/\//\-/g'`
+if [ "$array_sty" != "" ] ; then
+	array_req_ver=`grep -F -e '\NeedsTeXFormat{LaTeX2e}' $array_sty | \
+		tail -n 1 | \
+		sed -e 's/\\\\NeedsTeXFormat{LaTeX2e}//' | \
+		sed -E -e 's/\[/</' -e 's/\]/>/' -e 's/\//\-/g'`
+else
+	array_req_ver=""
+fi
 
 if [ "$LATEX" != "pdflatex-dev" ] ; then
+    if [ "$array_req_ver" = "" ] ; then
+	echo "array.sty is not found!"
+	echo "Check your TeX Live installation."
+	exit 1
+    fi
     if [ "$array_req_ver" \> "$latex_ver" -a "$WARNEXIT" = "1" ] ; then
 	echo "#### array.sty requires a later release of LaTeX2e.     ####"
-	echo "#### arary.sty requires LaTeX2e $array_req_ver,           ####"
+	echo "#### array.sty requires LaTeX2e $array_req_ver,           ####"
 	echo "#### while your LaTeX2e is $latex_ver.                ####"
 	echo "#### Check your TeX Live installation.  (Known issue under Fedora 44.)"
 	echo "#### 1st option is to downgrade array.sty to v2.6n."
-- 
2.25.1

