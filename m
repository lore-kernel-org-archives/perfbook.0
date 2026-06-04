Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86B7363084
	for <perfbook@vger.kernel.org>; Thu,  4 Jun 2026 10:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780568688; cv=none; b=Wycbp7HisxHf1JjJoGUVTQhoJlHnSDOaGoS95i1/IJZrpYf3MBkBbyiTbMGpbndTo1p+rP+N0EwEPu2gjZ0fXAEdHCOgVbSKxQeF4vvxMPqGijfjkTE+MiTb+9L7Bj69XOOiITQWw/ZMr4pa7OzFfJQz5FChUhhUw3o91ewy4ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780568688; c=relaxed/simple;
	bh=3R53/tQotteY1QBqoKFrfs+UX+rVM8ugfT0QH1xaqH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V5+bvzZEkCBV8dXIxbpUsvHR3RLe7THpDPha5ACr9+LYsklQKUswVwd1DGDjbF4vA1kEiYmHBmwe9+QfSBpxhwS+7wLx3IRQRYF3dkfXOUtdUJTKOm5XK8Z/kqv9EGBcbkwj9lz17Oj0gXH7u51AlunK0J0GJv+AyBtTPEoU7Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NKGljl7U; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NKGljl7U"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84230ab8857so223217b3a.1
        for <perfbook@vger.kernel.org>; Thu, 04 Jun 2026 03:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780568686; x=1781173486; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vGyxamxqY+u7UVR7N2guqLYuFIeD9f98L62WxlesP84=;
        b=NKGljl7UqF/nldrXIQtXNMkpOpUINAgfgmCpkmUZg/kUQILqKMK6qnV50B7j6azVIV
         fyuRFy2shcZZPbOnYbzanNdsT78Nq8o0otUsvhElmLLozTv4VunDKfbCwfLpgGtM4HyI
         KDNW2CNLDleN0hAJ1W1DzXvyVl/42lWqXWU2/BBUqFcWN6EtRHHerV2XQa0Otk3aqVFo
         2G5NWzMC/wQQlHmeQlwNujkGhWJJBgxOj/zw8ypE7AeHp46UjBeqCOmsDTZYRrG17Di+
         o0DrEraS7C4qPWtUK8fRyutpAekPk9A6pd3grllYkYpzGF+kxBikIljd9QWNoJE4+qT7
         2iqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780568686; x=1781173486;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vGyxamxqY+u7UVR7N2guqLYuFIeD9f98L62WxlesP84=;
        b=DFaEiRYKR1YVvcjjgoyTB5JH2tkMAU9JVS2xYgZJH4GRnVu8PtdBS6n+sc+8x4f/Mk
         r7y6QAJKrNlJQ8eoreqrLmAl3WQKWckwcugF4dMfKksmpxC5gpLxNSIhmvhFJdJ6Hgux
         +Hk287YeOAJJr1k2YTpg0gTGq0V/rMleAn3umuJieN0BgbCBGPPAv4sn+V/MLxvqVvsu
         y6i08OyQOj1jy9ZAZdLKbVVdYkD5LnT+eruzh9Uc9rwj0xfA7jZcAcoEwoqf3ZLYTWnE
         yvsg+iN9h9vsyCN+TSEjR/SxkF2YZPvgoEj085aqEcR1nAWVeA+O0s6dD31SbCSSeSz7
         z+Jw==
X-Gm-Message-State: AOJu0Ywc4PSTqXc7FlN1HMLBUGDUW6hk777hBlXDcrw4I0n2m5c/ADhU
	zawMkvlrZ3WqISr7/Iy1lqaeg9UoudzMvalvcHjxFqiEsIvmz2FTkQ6T
X-Gm-Gg: Acq92OG4awM0ABbF4/N4ctyHKnDLjWSBSBaVN/tx3aXoqWwCt+SGltFtousFaxlpdsb
	eo8tECo64NgqElLExfFEiTcIxu0x2TTa9wOj9LjicwCpHGV2HwgAPmEYt7w6y2QuEW5e1phaKJ1
	4Y3h0xI+1f1Q72cLDXB1vKg8VxKjjx9wr2ILaoRZthuskLSiLad8nhfz/4ZrzPklzzoh5a97w13
	aUw1Hew9HlMQA1sja3n6NohMc58Puk29vgosNqtS8ujoNtCOVgTq6VgcORO0g8/pahEYX4nQRyH
	yRuo4LayYia9UP/rSsSqzdZuVTnmIz7pbrdXPzRMzjU1TBDTxs9L0qNfmet4DbN2MJxpuD0JrGY
	MrIGhTNne0k3D9N1hgF9OLMWsq4wT8C6YmpYhEZpznDiZpSpHD3e27eRc5ltQkxJwVODkPVNsCX
	23jtHgMGUITq7RhZge2B0vlwoNAG3VO3lEUtKG4cW/uT6zdCaF6Ac1s7H9Xms76Z5AYaNsmuICk
	USHsoI=
X-Received: by 2002:a05:6a00:94e8:b0:842:5711:9a2f with SMTP id d2e1a72fcca58-84284eecff3mr6762946b3a.36.1780568686114;
        Thu, 04 Jun 2026 03:24:46 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221086sm5629462b3a.10.2026.06.04.03.24.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 03:24:45 -0700 (PDT)
Message-ID: <ae1c88ad-7753-46a8-988d-00912b2e61a0@gmail.com>
Date: Thu, 4 Jun 2026 19:24:44 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 5/6] Stop using "cleveref" with LaTeX2e <2024-11-01>
 and later
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <238a898f-78dd-48ff-b2b8-996b477dbcf6@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <238a898f-78dd-48ff-b2b8-996b477dbcf6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since LaTeX2e <2024-11-01> release, "cleveref" has experienced
quite a few behavior changes.

It turns out that it is possible to emulate cleveref's and its
derivative commands we have in the preamble by using "zref-clever".

Quote from zref-clever's documentation [1]:

  ... And the package’s name makes it clear that the core of the
  envisaged feature set is that of cleveref, even though the attempt
  was less one of replicating functionality per se than that of
  having it as a successful point of reference, from where we could
  then try to tap into zref’s potential. Indeed, although there is a
  significant intersection, the features of zref-clever are neither
  a superset nor a subset of those of cleveref.

So, here is my first attempt of the transition.  There can still be
some missing pieces, but the resulting cross-refs look mostly the
same.

As there is no use of fixcleveref.ltx any more, remove it.

Links: https://mirrors.ctan.org/macros/latex/contrib/zref-clever/zref-clever-doc.pdf [1]
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 fixcleveref.ltx | 12 -------
 perfbook-lt.tex | 90 ++++++++++++++++++++++++++++++++++++-------------
 2 files changed, 66 insertions(+), 36 deletions(-)
 delete mode 100644 fixcleveref.ltx

diff --git a/fixcleveref.ltx b/fixcleveref.ltx
deleted file mode 100644
index 76a2b591..00000000
--- a/fixcleveref.ltx
+++ /dev/null
@@ -1,12 +0,0 @@
-\makeatletter%
- \providecommand\IfFormatAtLeastTF{\@ifl@t@r\fmtversion}%
-\makeatother
-\IfFormatAtLeastTF{2024-11-01}{%
-  \AddToHook{cmd/appendix/before}{%
-    \crefalias{chapter}{appendix}%
-    \crefalias{section}{appendix}%
-    \crefalias{subsection}{appendix}%
-    \crefalias{subsubsection}{appendix}%
-    \crefalias{subsubsubsection}{appendix}%
-  }%
-}{}
diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 9957abef..ba40146e 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -164,6 +164,16 @@
 \newboolean{indexhier}
 \setboolean{indexhier}{true}
 \newcommand{\IfIndexHier}[2]{\ifthenelse{\boolean{indexhier}}{#1}{#2}}
+\newboolean{usecleveref}
+\makeatletter%
+ \providecommand\IfFormatAtLeastTF{\@ifl@t@r\fmtversion}%
+\makeatother
+\IfFormatAtLeastTF{2024-11-01}{ %
+  \setboolean{usecleveref}{false}
+}{ %
+  \setboolean{usecleveref}{true}
+}
+\newcommand{\IfCleverefTF}[2]{\ifthenelse{\boolean{usecleveref}}{#1}{#2}}
 
 % Tweak width params of TOC
 \makeatletter
@@ -409,26 +419,60 @@
 \captionsetup{hangindent=20pt}
 \captionsetup[listing]{hangindent=20pt}
 
-\usepackage[capitalise,noabbrev,nosort]{cleveref}
-\crefname{subsubsubappendix}{Appendix}{Appendices}
-\crefname{sublisting}{Listing}{Listings}
-\crefname{sequencei}{step}{steps}
-\Crefname{sequencei}{Step}{Steps}
-\crefname{enumi}{item}{items}
-\Crefname{enumi}{Item}{Items}
-\crefname{page}{page}{pages}
-\Crefname{page}{Page}{Pages}
-\Crefformat{equation}{Equation~#2#1#3}
-\crefformat{equation}{Eq.~#2#1#3}
-\newcommand{\crefrangeconjunction}{--}
-\newcommand{\creflastconjunction}{, and~}
-
-% Define \crefthro{} for "Sections~m.n through~m.p"
-\newcommand{\crefthro}[2]{%
-  \namecrefs{#1}~\ref{#1} through~\ref{#2}%
-}
-\newcommand{\Crefthro}[2]{%
-  \nameCrefs{#1}~\ref{#1} through~\ref{#2}%
+\IfCleverefTF{
+  \usepackage[capitalise,noabbrev,nosort]{cleveref}
+  \crefname{subsubsubappendix}{Appendix}{Appendices}
+  \crefname{sublisting}{Listing}{Listings}
+  \crefname{sequencei}{step}{steps}
+  \Crefname{sequencei}{Step}{Steps}
+  \crefname{enumi}{item}{items}
+  \Crefname{enumi}{Item}{Items}
+  \crefname{page}{page}{pages}
+  \Crefname{page}{Page}{Pages}
+  \Crefformat{equation}{Equation~#2#1#3}
+  \crefformat{equation}{Eq.~#2#1#3}
+  \newcommand{\crefrangeconjunction}{--}
+  \newcommand{\creflastconjunction}{, and~}
+  % Define \crefthro{} for "Sections~m.n through~m.p"
+  \newcommand{\crefthro}[2]{%
+    \namecrefs{#1}~\ref{#1} through~\ref{#2}%
+  }
+  \newcommand{\Crefthro}[2]{%
+    \nameCrefs{#1}~\ref{#1} through~\ref{#2}%
+  }
+
+}{ % emulate cleveref via zref-clever (not portable before 2024?)
+  \usepackage{zref-clever}[2023-11-14]
+  \zcsetup{cap=true, nameinlink=false, lastsep={, and~}}
+  \zcRefTypeSetup{sequencei}{
+    Name-sg=step,
+    name-sg=step,
+    Name-pl=steps,
+    name-pl=steps,
+  }
+  \zcRefTypeSetup{sublisting}{
+    Name-sg=Listing,
+    name-sg=listing,
+    Name-pl=Listings,
+    name-pl=listings,
+  }
+  \zcRefTypeSetup{page}{
+    Name-sg=page,
+    name-sg=page,
+    Name-pl=pages,
+    name-pl=pages,
+  }
+  \newcommand\cref[1]{\zcref[nocomp]{#1}}
+  \newcommand\Cref[1]{\zcref[S,nocomp]{#1}}
+  \newcommand\cpageref[1]{\zcpageref{#1}}
+  \newcommand\Cpageref[1]{\zcpageref[S]{#1}}
+  \newcommand\crefrange[2]{\zcref[range,rangesep={--}]{#1,#2}}
+  \newcommand\Crefrange[2]{\zcref[S,range,rangesep={--}]{#1,#2}}
+  \newcommand\lcnamecref[1]{\zcref[noref]{#1}}
+  \newcommand\cpagerefrange[2]{\zcpageref[range,rangesep={--}]{#1,#2}}
+  \newcommand\crefthro[2]{\zcref[range,rangesep={ through~}]{#1,#2}}
+  \newcommand\Crefthro[2]{\zcref[S,range,rangesep={ through~}]{#1,#2}}
+  \newcommand\namecrefs[1]{\zcref[noref]{#1}s}
 }
 
 % Define \clnref{} and \Clnref{} for reference to line labels
@@ -477,8 +521,8 @@
 \newcommand{\Clnrefrange}[2]{Lines~\lnref{#1}\==\lnref{#2}}
 \newcommand{\clnrefthro}[2]{lines~\lnref{#1} through~\lnref{#2}}
 \newcommand{\Clnrefthro}[2]{Lines~\lnref{#1} through~\lnref{#2}}
-\newcommand{\pararef}[1]{Paragraph ``\nameref{#1}'' on Page~\pageref{#1}}
-\newcommand{\Pararef}[1]{Paragraph ``\nameref{#1}'' on Page~\pageref{#1}}
+\newcommand{\pararef}[1]{paragraph ``\nameref{#1}'' on page~\pageref{#1}}
+\newcommand{\Pararef}[1]{Paragraph ``\nameref{#1}'' on page~\pageref{#1}}
 
 % geometry setting
 \newlength{\twocolumnwidth}
@@ -593,8 +637,6 @@
   \input{fixfvextra.ltx}
 }{}
 
-\input{fixcleveref.ltx}
-
 \begin{document}
 
 %%HTMLSKIP
-- 
2.43.0


