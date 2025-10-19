Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AE41096F
	for <perfbook@vger.kernel.org>; Sun, 19 Oct 2025 08:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760861838; cv=none; b=cnWHNn1+Pr9IA2f40x9/G5PjR8zYJcSAkqRixn0tABZXczRnw3Y7yNvtkAL3qEoIMSgKN5/4Rg1Iw5OcfjieL7GOWN57MBrqk34tdQxIhw771jp7eaczsg35L79hkqIswXQR4BsZpKURI4Zj1uzDZMkd8LSI8glIlmCUdlm4oDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760861838; c=relaxed/simple;
	bh=OJ8zi8Lcz1GGMwQvgU6gtVdDFz0xZRl/5amtU33LLQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A6k8OVMgNGzEb79wbT2viFPOuSl9N+payVKc5cfEgJEqgioEWySHCZIaqTsPxTgo4bzPRCP21LRyj2AbjmTJtfe1zh1j6t8axFwctmePc4xSFXavwbn7YVZKwqp0ciwVvRQgGSvw3xqndX3iT8SKQ8NKs6wi9qwSbMzOlFTwW2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HzCbBrVY; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HzCbBrVY"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-77f343231fcso2212967b3a.3
        for <perfbook@vger.kernel.org>; Sun, 19 Oct 2025 01:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760861835; x=1761466635; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y7Y4PTlVyvufUagM0WbXY9S7XY8ZR37BwFGyyWqhtwQ=;
        b=HzCbBrVY9e9tn22zkzyZnCq8YpMGGpiPbqGW+ZUcEaw9ZXPlQsHlm2SYpepe8hFDBU
         tAjWcPc79qLWvfWA3nqDeaV5rI/1SXeW77n8dwUGI7aipcqRmyl8PcFw2vMvfa1uQ7ZM
         JP4bL9Syf0PS/kWzUIXPcO5mNlxso8rnPVNIUNQv6OezzklzrVRZahFwjqxdhHFQCw7+
         tD5CbZMakZDSqwkN8tXcwFMgUM/tyXW7jtAXEZ09RbbTBDnJouf8I0xiKCtULC4hd823
         c4qBi8tf3V/zPnc4oIoeIqctoeNSjlvv9QCWdDQ6hj9sXtakwznYyd4/yLKepWSJZPNF
         bQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760861835; x=1761466635;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y7Y4PTlVyvufUagM0WbXY9S7XY8ZR37BwFGyyWqhtwQ=;
        b=UYGuV2uuu44//CPR3mKGLECF6a2nyHTRVgT2F1+MrA2wf6nhHWrrtWcsI1VPCPmy6t
         cFVP4DrkJVFo+7L+ucXaSeRJUV7DcRyBeOAjdRNwoSVy8JrlzY4ZIN3NwlNJohI3vlIZ
         8egiBZ/RKDSVS4LsbKzTa5uOlpt3HgcozIGzYwF1ZNmLmA0rsntKES2LgVi+q6RlXFcs
         QLNQ/V+Z6jvEgYhg22THOLATklDGPLTqioy8D3SpEnE0UhzaFFW5NOWf5MYy3Z5P1wAK
         AlJEI83HlZfb0vPeuR2yBmtRSNan6JzaJ91I2P1B1w6jgZTA7C6CqaG5ZpLDZZUMkLzb
         CqSQ==
X-Gm-Message-State: AOJu0YwFs76HbZUpgqpTsGWT+qJVNIb0rNnLraXiLmue7jNrzxdIyUqv
	6Twqq27kmSVPuQlUZemrlI3drNfXlbvePZvE/4tCc3F6pjc5agr4324d
X-Gm-Gg: ASbGncs6nyWHX29ZMrdmoaHVPAtl+yQ5ACZMEwvvVVSYXRSvuNLPEnDadDfr4i/3Z5p
	oHbYC88duA12c8VzYX0Vb6ow4bJOMpRCtDEXdlMJomwdKhPrUCb1u4OT/QvGPHErlvVAUgQyJUH
	cU8319BxyoYSEsO1aGEij1c54hZIC0mB7MAT+NVc5TPfmJKtUdXjWgZ4TWg2e+KPY2jf70W+kKC
	eLxT1yfsukScCEK60WInasxH2LmD1mqoMYCEjJSMoWVktMDw72H1+dXHAsJPbgbt6Q3LRlu2gPE
	Rc59dDWxWQG+gKr/CY/+hJkB+jRK+CypN7ky3O7u25rOW+C1RAbK5NzvVbH3jwMyRt3dLXiFrZm
	oyR5WwcTgeSTjJ1imgd8Lzx/t5LPiGTph8cGd8v5ml+nn3vxIC4n+UatLfnuHbFX0RHloOHhYro
	JwBx490E+FUiPRhAJJXbcS3XY8Va1ejmt3BRe5ACdacQ4f0pscrSOupM1E
X-Google-Smtp-Source: AGHT+IEHCVauZy0y+g3BRKch3pR2T+sPelbfN5Z3IRi9J/I68deFUq9laHn7L3Hq6rQygHoWQ6PI4g==
X-Received: by 2002:a05:6a20:a108:b0:32b:83af:11ff with SMTP id adf61e73a8af0-334a8515191mr13033391637.2.1760861834996;
        Sun, 19 Oct 2025 01:17:14 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff158bdsm4959246b3a.16.2025.10.19.01.17.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Oct 2025 01:17:14 -0700 (PDT)
Message-ID: <7299cff0-f637-4c05-8326-50f3a1bba4a5@gmail.com>
Date: Sun, 19 Oct 2025 17:17:13 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 2/2] Detect buggy fvextra and apply patch on the fly
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <f3241d2d-833e-4ce8-9fc5-d23a42f5a8c5@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <f3241d2d-833e-4ce8-9fc5-d23a42f5a8c5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

fvextra versions from v1.11.0 to v1.13.2 (latest) have a minor regression
which ignores fancyvrb's "samepage=true" key.  It is used in perfbook to
prevent short snippets from broken across columns/pages.  This is a minor
regression but affects reproducible build of perfbook.

Unfortunately, distro texlive packages based on upstream TeX Live since
early March 2025 are all affected by this regression, including debian
trixie and opensuse/leap 16.0 (Long Term Support); and ubuntu plucky
and questing (Rolling release); as well as archlinux and
opensuse/tumbleweed (Rapid release) as of this writing.

This issue was reported upstream and a tentative one-liner fix was
provied by Yukai Chou at [1].

Add code in autodate.sh to detect buggy fvextra and have a boolean
"buggyfvextra" set "true" in autodate.tex.

In the preamble, conditionally load fixfvextra.ltx which contains the
tentative patch to be applied on-the-fly.

Link: https://github.com/gpoore/fvextra/issues/32 [1]
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile              |  1 +
 fixfvextra.ltx        | 11 +++++++++++
 perfbook-lt.tex       |  7 +++++++
 utilities/autodate.sh | 17 +++++++++++++++++
 4 files changed, 36 insertions(+)
 create mode 100644 fixfvextra.ltx

diff --git a/Makefile b/Makefile
index 29d7c99f..1e63c0b5 100644
--- a/Makefile
+++ b/Makefile
@@ -13,6 +13,7 @@ LATEXSOURCES = \
 	pfbook.cls \
 	ushyphex.tex pfhyphex.tex \
 	ack.tex \
+	*.ltx \
 	*/*.tex \
 	*/*/*.tex
 
diff --git a/fixfvextra.ltx b/fixfvextra.ltx
new file mode 100644
index 00000000..b79411c5
--- /dev/null
+++ b/fixfvextra.ltx
@@ -0,0 +1,11 @@
+\makeatletter
+\AtBeginDocument
+{
+  \def\FV@bgcoloroverlap{%
+    \ifx\FV@backgroundcolorboxoverlap\relax
+    \else
+      \nopagebreak  % <<< added
+      \vspace{-\FV@backgroundcolorboxoverlap}%
+  \fi}
+} %
+\makeatother
diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index e1dcd03f..6dc698d1 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -108,6 +108,9 @@
 \setboolean{noqqz}{false}
 \newcommand{\IfNoQqz}[2]{\ifthenelse{\boolean{noqqz}}{#1}{#2}}
 
+\newboolean{buggyfvextra}
+\setboolean{buggyfvextra}{false}
+
 \input{autodate} % need to input here to reflect tag state
 \usepackage{qqz}
 \usepackage{origpub}
@@ -583,6 +586,10 @@
 % Glossaries dictionary and custom settings
 \input{glsdict}
 
+\ifthenelse{\boolean{buggyfvextra}}{
+  \input{fixfvextra.ltx}
+}{}
+
 \begin{document}
 
 %%HTMLSKIP
diff --git a/utilities/autodate.sh b/utilities/autodate.sh
index 1efdbdee..839db7f3 100644
--- a/utilities/autodate.sh
+++ b/utilities/autodate.sh
@@ -133,3 +133,20 @@ if [ $(echo $tcbversion $tcbold | awk '{if ($1 > $2) print 1;}') ] ;
 then
 	env printf '\\tcbsetforeverylayer{autoparskip}\n' >> $fn
 fi
+
+# check if fvextra is buggy ("samepage=true")
+FVEXTRA_BUGGY_SINCE=v1.11.0
+FVEXTRA_BUGGY_UNTIL=v1.13.2
+
+fvextra_sty=`kpsewhich fvextra.sty`
+if [ "x$fvextra_sty" != "x" ] ; then
+	fvextra_ver=`grep -E -e 'v[0-9\.]+ fvextra' $fvextra_sty | \
+		        sed -e 's/.* \(v.*\) fv.*/\1/'`
+	fvextra_since=`env printf "$FVEXTRA_BUGGY_SINCE\n$fvextra_ver" | sort -V | head -n 1`
+	fvextra_until=`env printf "$FVEXTRA_BUGGY_UNTIL\n$fvextra_ver" | sort -V | tail -n 1`
+fi
+
+if [ $fvextra_since = $FVEXTRA_BUGGY_SINCE -a $fvextra_until = $FVEXTRA_BUGGY_UNTIL ] ; then
+	env printf '%% fvextra buggy: %s\n' $fvextra_ver >> $fn
+	env printf '\\setboolean{buggyfvextra}{true}\n' >> $fn
+fi
-- 
2.43.0


