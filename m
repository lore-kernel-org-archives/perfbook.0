Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAECD3E317D
	for <perfbook@vger.kernel.org>; Mon, 13 Jul 2026 09:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783936589; cv=none; b=KaWRFD3qgDIX0IHc9bBzwWsm3N2gj5MPvaESKADz5n1GCD1UHcNsHqx5gefeJ6HK5Ps3RmKth6pVbkhBAG2OED8EykQ6tamtpVMw97Jl3VKS7uYWPpgyCwgZ5UIl7In7vFQNpMeFzqW1FH4CkSFz/sW49aA9shUgWc85i3WoucA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783936589; c=relaxed/simple;
	bh=ah77wYtd8HvVL6GtLq2j7nooz6VqjcCdoesBDqwwhTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V0MYlQLugFYyZ9dUEDizaNIBdqQ213dllsgCSq2Qh8aaNhpITGlLrh+gpSWk40Z8oLiT5/T82E2PdNHRHQOZyRA+X/Nad1Tz9+RY2yjMhOqGHgU8mSiJav8GvLwulN2AugKFvPN3H7EJldlZweU+qRYwg8eiBlT0IkLocg/CULw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sp8H9dVu; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sp8H9dVu"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8484a0b998fso4489242b3a.2
        for <perfbook@vger.kernel.org>; Mon, 13 Jul 2026 02:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783936585; x=1784541385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OWWur4wsQewhihygwFr4G+uJQXEpwNgeDo60b/6ClVI=;
        b=sp8H9dVuh9FQC0X1gNRVK+fZ5UvEw47RfLgvQqR6HWSCl9S2Q4CpOxEsyL+CeOohxs
         e+VRmW9oO9f1txM0GVL/9M0rbwjtsYt2PjLAJoWkxfTo8CZJlmhHSxsZ3v3Cn801QATo
         /ZNW7nZ8OsMGUWMzIMUr3M8AwqOemrnGtJNgGnjftEvexf0ohIxS8haJKK+cS/NCaThK
         zB7ukoOE7X9jl37cwDrvaX7qGgcMN6hcsKwO//hOwLddDXcD3ltfxOTx8Rgqp5ALM4Ul
         ccO5SwyjKJxpQF3vVKpSU0HaHVS/tleDeO3k0GqD8wh44L27UkODteLBkZf3BFVbnnDO
         7EpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783936585; x=1784541385;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OWWur4wsQewhihygwFr4G+uJQXEpwNgeDo60b/6ClVI=;
        b=Xx5h5TPpa3tB9cYlvQEVs9R5aXhfIPHEAjNKXRWyLja52AQGAUUyW8nI1BCq4qOiU9
         F2y/WuSD5MgaocKzZ+FLCa4yqp/fDRj2Kmxf38dwjF7kx06anrRvs7epCabFqFzxQFr3
         hJ9wjkU7zjkGjTsXoNOQPmhKQWMFL11Vbqp+hBaZHXfQ7bfMpzlysmFuZaDp/ADD6PAJ
         Cdnqhk//XrdDFLAFJ3S7tC//g/26zQofxcAWstuAL2AEh58wZNkIRCEENE8yn/KFRX8Z
         SNmOHcLI52vsgX9yGRTprXEJg2qvXVPjEx786VFjUz5D+vgSCmlcyOleMZ4mGF5/QqEn
         HSPA==
X-Gm-Message-State: AOJu0YwFAnqe/rk5qyRiRJoTGc6JaMiXA24JnGq85WZKTa4zEUTFQ4Vn
	u+ZiuZuaj3vtfmGpfjt+qu3/Mmm1UcIVhSj7AodY1t7N4Ey08iELaS0MycPwwA==
X-Gm-Gg: AfdE7cmORBtWKaqA1gH7ax7OLWKOicEvTlhwyaNsoy84Gs6p7deNKN5nwoBrYzS+/Zi
	DiybJX8Qka4PJ1Znlw0pnAKKJopmDUMGdhza0Ua4cUWi4cqqT61T8WotviEUm4/VJvGyknMbckf
	PfKrzeo4LxFmDD7gP2ioxWQ5kI1Bjnn0JNe+lWGqQZnIDvG1Vqg264hq7IUVswBHyjF76K7ZT2x
	dtdPI4bDbKr2ikXwxiWlhx2nq8wPK7Wq8onxEWekjsADSJxfjpxSHbGlKKMz43x2Ub3R1xZ08JM
	qMGc3j+LUqCGVFa8AgqOUzHflZ/B1l4GD6aTRs9D+Am1hbPvD7oAGsmoFdLlPcFuvVWaIwQnQql
	u4Yh2fKmwFtQJZPJyozHa9bvNQ4kEFR2A7OomKeDp+qGoIk328/y/82b8PMSGhyk9HjangVC7s6
	YeKL1n1bZVnH9iKVrAV6UFHauhbtEQu/cI94sJY4tSO505uhjWR7O+IFSRpA==
X-Received: by 2002:a05:6a00:8c9:b0:848:77b2:20a with SMTP id d2e1a72fcca58-8488970b724mr7301212b3a.39.1783936585236;
        Mon, 13 Jul 2026 02:56:25 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3162f65sm8064674a12.21.2026.07.13.02.56.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 02:56:24 -0700 (PDT)
Message-ID: <0942d73a-7ce8-4d47-b14e-4fb22739b9f7@gmail.com>
Date: Mon, 13 Jul 2026 18:56:23 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 2/3] Adjust position of hyperlink targets of line
 lebels in Verbatim{T|N}
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <bca22163-1a29-4680-a037-f895cf38d630@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <bca22163-1a29-4680-a037-f895cf38d630@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

With hyperref.sty prior to v7.01q (2026-04-24), hyperlink targets
in VerbatimT go one line below where they are expected to be.

As a matter of fact, with latest hyperref.sty, hyperlink targets
in VerbatimN go one line above where they should be.  This is
because VerbatimN env has a mitigation for old hyperref.sty.
It does wrong thing with latest hyperref.sty.

Fix these minor compatibility issues by making the tweak conditional
to old hyperref.sty for both VerbatimN and VerbatimT envs.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Note:
 \IfPackageAtLeastTF was added in LaTeX2e <2020-10-01>.
 It is emulated by \@ifpackagelater for older LaTeX2e.
 It can only be used in preamble at the time.  Hence the use of
 boolean "adjlabelpos".

--
 perfbook-lt.tex | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 6f0b224f..4797c951 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -167,6 +167,7 @@
 \newboolean{usecleveref}
 \makeatletter%
  \providecommand\IfFormatAtLeastTF{\@ifl@t@r\fmtversion}%
+ \providecommand\IfPackageAtLeastTF{\@ifpackagelater}%
 \makeatother
 \IfFormatAtLeastTF{2024-11-01}{ %
   \setboolean{usecleveref}{false}
@@ -647,6 +648,13 @@
   \input{fixfvextra.ltx}
 }{}
 
+\newboolean{adjlabelpos}
+\IfPackageAtLeastTF{hyperref}{2026-04-24}{
+  \setboolean{adjlabelpos}{false}
+}{
+  \setboolean{adjlabelpos}{true}
+}
+
 \begin{document}
 
 %%HTMLSKIP
@@ -710,10 +718,14 @@
 \newcommand{\lnlbl}[1]{\phantomsection\label{\lnlblbase:#1}}
 \newlength{\lnlblraise}
 \setlength{\lnlblraise}{6pt}
-\AtBeginEnvironment{VerbatimN}{%
-\renewcommand{\lnlbl}[1]{%
-\raisebox{\lnlblraise}{\phantomsection\label{\lnlblbase:#1}}}%
-}
+\ifthenelse{\boolean{adjlabelpos}}{%
+  \AtBeginEnvironment{VerbatimN}{%
+    \renewcommand{\lnlbl}[1]{%
+      \raisebox{\lnlblraise}{\phantomsection\label{\lnlblbase:#1}}}}%
+  \AtBeginEnvironment{VerbatimT}{%
+    \renewcommand{\lnlbl}[1]{%
+      \raisebox{\lnlblraise}{\phantomsection\label{\lnlblbase:#1}}}}%
+}{}
 
 \newcommand{\lnrefbase}{}
 \newcommand{\lnpref}{}
-- 
2.43.0


