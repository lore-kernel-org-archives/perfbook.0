Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEA82E1F06
	for <perfbook@vger.kernel.org>; Mon,  2 Mar 2026 09:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772443401; cv=none; b=gvInQSnFagBVu/8HVR5E3Z6Z6/LLo8SFWGMm2Pvgzl30bKX9jF+LIcUHgnx3Fz9NEEqfYTw1W+TdqWvbWe1UhMAqzTEo12ecXi02Du0PkQmROVmSaQgCdFwflaZJbXREMYCgJ5Mr8r+As99YetfSHNIb8p51s/qBF/sSR3lfDdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772443401; c=relaxed/simple;
	bh=dHn4at61/lDpgCiT2qqYJJvonI11l0uO7Z2BNkVBbIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JDpgxi8XBbWxr80VD9kCR8TOcV9eHi2+5JzGWMygoZCMUGgC6nrusFRV4CEIhcFhY7eaB+IKzDeYI1qFs6FQeNcisI6o9ongrWokfzFBvJAmojVFsohFetq+DnNMw//Q5OnkziIBcCcSq3mEKJcHrHKRpuNQxVtfsW+WsjBUI00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D9oSwS2N; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D9oSwS2N"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ae41544dcfso16678295ad.1
        for <perfbook@vger.kernel.org>; Mon, 02 Mar 2026 01:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772443400; x=1773048200; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NNSRqWeGKJyZryKdlA1iBl7HltaJTkSwNzud0LomeQQ=;
        b=D9oSwS2NMDjbv2+3X33yFG8YjrDx0C7EtzYMDAPDaVlKzsFVP035WWAhwHP3aN7t0n
         dchfFBP+uYoo/rzxoHCLJHzhlul7Btejq6eL7J+Lv/enfukr/pdYrhANMjPNf63s4ZWE
         TaFgzs96etbL7nkV/lKTn6AaRZcbkC7DRb6X9YCjlw3ozIXBaqzMjwMQNFSVItKS1AZD
         J5FjveTnOsRI8Xo8we4XVy46oraX6nvNs48vxLYNlJSBmPO7VaUcuuwwnqDqDK6onDaI
         K9ifHDY87Gn+W2CxEZxOIAZmEfmGkFD3q1Mgwv1peLAtBlu6aCuFR+pzKdAXRVQ4bcl6
         9NfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772443400; x=1773048200;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NNSRqWeGKJyZryKdlA1iBl7HltaJTkSwNzud0LomeQQ=;
        b=hnDo+f/+HNl7kCYfkW3LSjSmfD9ra9to9b2qCPnMtRvoZXPgoJSE/wYYGrhy5RiI5y
         vuiPSObQzHKt6zmFFrulPTecnlEvms8nyaDQ2SR4EjJ7QlaqQA8s6peYsUzElvjj1v8l
         31v20qGo9REqWX4sr1DL/UekONXxvLsnfK+FEfRcbdXYQO7P2OnOuUsbSrg/C+SfosOn
         Y4GPHmvyGfNEgwBm7fyNRag3N28EBfEN98Xw6dWOu0VAP34HRV/owl5M/u8dt9Wmlp9j
         ErfWapFII6rt3uoWczT16JQgfhe0RunslSsTBh/oOk5gQNLlRsECGXh6wCGez7qtzYyx
         mNqg==
X-Gm-Message-State: AOJu0YzLH1p7l+EzUrcHfVk81p60p2ZUaDm+QwFAmzatDR3wYurUZE/U
	xLm4heSFf7/4xQ9hSt8dtVH7/O4wMZFwi/CTivsvq6bDIo9X2S2ldUGb
X-Gm-Gg: ATEYQzytPS2m5zyUY27B/QXU/fT9oMOlzn1MzrWwA/hEsqmprfDLWbO3H7wBHqJxwRA
	hYfnL915F2ciXxRWEA4Xhw6E+/0UWyg/Y+RrloiNZ88o0bCX7ctKTUkU/EMSLwtGtZ5/tq11q8n
	xrTnL5trUd8yDqFCNdFCRDvgFBALWHs3nmNn00asd7AiiqGsrWv4TZw6jzI0Da5dydKhXaIOffY
	ri9uW5yZZdvvooPQp5vrUDBTtF46GX92eHVmR3e12ivQaoiIjOXbpjRlqKS4nGoXBiagZMHOcFo
	DBBfc+QFUcdgPF+nyEYhThhA+7J7JXTmMuDUmuX/oa1YjwWEDKDdFZt/YJfmM+OKLAvWt6nrM8R
	3YWyzu7VMD4voMPQjYUNivRAR/EX1Go8I1Z8YH6usUAhbsMZ0o1CbLQ9FIQNKTgOYliVjHjoWQ1
	vzYfvHI69oHI2xM/fhke0MnjR6+3YmioZ+1khk654T9VcuqO81LGDSfCAqvV8rIm8ghrSvECofv
	bzqSk4=
X-Received: by 2002:a17:903:1a6f:b0:2ae:59d3:27f8 with SMTP id d9443c01a7336-2ae59d32aa6mr6281735ad.19.1772443399753;
        Mon, 02 Mar 2026 01:23:19 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae3e4e34fesm64586825ad.28.2026.03.02.01.23.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 01:23:19 -0800 (PST)
Message-ID: <73f4d3ff-7fcd-4888-92c2-e39f4d1bd156@gmail.com>
Date: Mon, 2 Mar 2026 18:23:21 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 5/7] Adjust page header/footer widths for tweaked
 textwidths
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <28c46b77-ceb8-4b4f-9f8e-d56ef6b2711d@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <28c46b77-ceb8-4b4f-9f8e-d56ef6b2711d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

In 2c builds, Legal and TOC pages are temporarily switched to
1c mode, without adjusting header/footer width.

I was lazy in commit 114e330a528a ("Narrow textwidth of legal and
TOB pages in 2c build") and failed to investigate other approaches.

It turns out that the "geometry" package provides useful macros for
similar purposes with the bonus of natural adjustment of header/footer
widths.

Let's apply the "geometry" way of switching between 2c/1c layouts.

For bibliography pages, use slightly wider textwidth than that of
-1c builds for non-ebook size builds.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook-lt.tex | 31 ++++++++++++-------------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 724e1b83..78a26c21 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -666,21 +666,17 @@
 \newenvironment{fcvref}[1][]{\renewcommand{\lnrefbase}{#1}%
 \ignorespaces}{\ignorespacesafterend}
 
+\IfTwoColumn{\newgeometry{body={4.75in,8.25in},centering=true,onecolumn}}{}
+
 \frontmatter
 
 \IfEbookSize{\hypersetup{pageanchor=false}}{}
 \maketitle
 \IfEbookSize{\hypersetup{pageanchor=true}}{}
 
-\IfTwoColumn{
-  \onecolumn\begin{adjustwidth*}{.95in}{.8in}
-  \addtolength{\parindent}{6pt}
-}{}
 \input{legal}
 \tableofcontents
-\IfTwoColumn{
-  \end{adjustwidth*}\twocolumn
-}{}
+\IfTwoColumn{\restoregeometry}{}
 
 \mainmatter
 
@@ -715,24 +711,21 @@
 \input{glossary.tex}
 
 % Bibliograpy
-\IfTwoColumn{
-  \onecolumn\begin{adjustwidth*}{.8in}{.7in}
-  %\bibliographystyle{alpha}   % Use genuine alpha style (In case of build failure, use this instead)
-  \bibliographystyle{alphapf} % Use alpha style customized by urlbst with --inlinelinks option
+%\bibliographystyle{alpha}   % Use genuine alpha style (In case of build failure, use this instead)
+\bibliographystyle{alphapf} % Use alpha style customized by urlbst with --inlinelinks option
+\IfEbookSize{
+  % no geometry change for bibliography pages
 }{
-  \bibliographystyle{alphapf} % Use alpha style customized by urlbst with --inlinelinks option
+  % slightly wider than textwidth of -1c builds
+  \newgeometry{body={5.2in,8.25in},centering=true,onecolumn}
 }
+\begingroup
 \IfColorLinks{}{
   \hypersetup{pdfborder=0 0 1,urlbordercolor=0 0 0,pdfborderstyle=/S/U/W .2}
 }
 \bibliography{bib/RCU,bib/WFS,bib/hw,bib/os,bib/parallelsys,bib/patterns,bib/perfmeas,bib/refs,bib/syncrefs,bib/search,bib/swtools,bib/realtime,bib/TM,bib/standards,bib/OSS,bib/maze,bib/energy,bib/QC,bib/NP,bib/memorymodel}
-\IfColorLinks{}{
-  \hypersetup{pdfborder=0 0 0}
-}
-\IfTwoColumn{
-  \end{adjustwidth*}\twocolumn
-}{
-}
+\endgroup
+\IfEbookSize{}{\restoregeometry}
 
 % Credits
 \setcounter{secnumdepth}{-1} % surpress section numbering in backmatter
-- 
2.43.0


