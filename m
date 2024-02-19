Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035932E620
	for <perfbook@vger.kernel.org>; Mon, 19 Feb 2024 11:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708343804; cv=none; b=OSVxoA3Z1R71rkIqqQ3csTM06KjAL1GCZarnEh/+A/VEgEmVGoTOaCNPNQI1HghauFd/jb/FEZLwPcU+M1Q4HEqpLYhjRtGptWGluU8iggdjnHAFoHx74D4C7fQX7FAiU8xWzF54YV/iSHRUeH4UdC03abwc87xk2kawv/xxJis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708343804; c=relaxed/simple;
	bh=Ug2VV5z/MO+mOS5qiqZAYAoZDcnxEOpblQIQ6oikzAE=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=ZnH30cOIJbmAa1eyO42VU/b7dmAxfoHMV+coMmHCRUK3I639b+K7DraGBxs8Cz8JWdZJmrTJqLicC93FgEp8GHo9B5Gps/vBycqrQWXNqt8RCq1zfH907sSwqerF/M520wd+C3dT5Qawo0HuJ3kOSMEFe7hcIVsRQqahaNS+GD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U8gJZuyK; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U8gJZuyK"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-29938dcb711so1362670a91.0
        for <perfbook@vger.kernel.org>; Mon, 19 Feb 2024 03:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708343802; x=1708948602; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+l0hXWI7/81Rp5miU4BbUJLK4yiftv8p/gF4/DKtFA=;
        b=U8gJZuyK3CBbNSXVF4WhGLWTMN+xohav/5qtTLZascoW+G7P70qElg9B/yYDn5yGUq
         spPxWe0dueqfsCZi8qYKKPxvqz+VOCzgG+VXEzSha9SyOcgAhQ87twVrhxGKd4co7lfF
         6vPMoOs/5Os/J0VxK0+ceP0DmYKf5nyHUZhS4N55rvTPSoPqRxOp+TuxJ0xpkI+vTQim
         aEpdowiWlQ8snpL7Jxicfh8NaOYs7+T+KOObtYca2FTDFUimwaq2I/JKB5GJGFQoNEqy
         1cgmbMM6N7t7wCGGn2eKTEv3YBPsN8A6/t5QyqA8u8k/dzLhe72U07eoTxlEp2u7kgJX
         TlOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708343802; x=1708948602;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t+l0hXWI7/81Rp5miU4BbUJLK4yiftv8p/gF4/DKtFA=;
        b=qZsXGUWukK8G8zYluQxdN4pOe5vx3o97/yzpvA3wukZinf/24aEJ81TfU3Bi2s4W/9
         QXBNn0ho6wgRPcV2vzzmtUi9SQ1B4D/owzD4OsF6fJ6t6WZpYCp3Q5OOpsNgslCF707W
         W+0dyu6KsIaRImgzxctUroHTItBX9O6f7XK5bUyVi9c8x4WPISY19FkOaZi9uQHHGaZm
         AUOvXRNR+PRX8vq/FL9zMRUbvX19M+ZhyTB8Lb3+rmRoP75jR35CPD++odubU4XaN0Vd
         bGzSnFUErvIQ0ChHegkpTSj+1DloIzUia3eDie9u2aQkNSu8YSymfpgSli1pI3mj5Wsm
         jybA==
X-Gm-Message-State: AOJu0YyChBbXDqcDCLy1WzK0G8ejWcv+QoO8TtDJRdEW5XUbmaU9itdu
	S0QbgJVHeMzzI8ikVaLHct5IzvL7EZMPsGkGAO9wSt4sgmjfzNEqPT275eqY
X-Google-Smtp-Source: AGHT+IG5Wkqq1fKMGXI+6zH7GkB1t5zfdvi3Yeho6PZDibTJfjwNhZJtoqBvDfl9+m3hxbYeB+v10g==
X-Received: by 2002:a17:90a:f68e:b0:299:224f:5034 with SMTP id cl14-20020a17090af68e00b00299224f5034mr7137605pjb.46.1708343802101;
        Mon, 19 Feb 2024 03:56:42 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id y7-20020a17090a644700b0029942d11f3bsm4879555pjm.3.2024.02.19.03.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 03:56:41 -0800 (PST)
Message-ID: <dc597d49-37f0-44de-ba7e-45abc3aa6e3f@gmail.com>
Date: Mon, 19 Feb 2024 20:56:40 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] Cope with behavior change in newtxtext v1.738
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Recently, newtxtext's behavior of sans-serif font setting has become
unstable and the option helvratio stopped working as of newtxtext
v1.738.

As a workaround, load tgheros.sty provided by the tex-gyre package
before loading newtxtext with the same scaling facter which works
with previous versions of newtxtext.

Do similar changes in pstricks figures under SMPdesign/ which use
sans-serif font only.

Note:
newtxtext's main feature is to provide improved Times Roman clone based
on TeX Gyre Termes.  The author of newtxtext doesn't pay much attention
on sans-serif font behavior, it seems, and has made v1.738 and later
respect default sans-serif font at the time of loading newtxtext.sty.

Changelog in newtx's README [1] reads:

Changes in version 1.738
1. Documentation updated for newtx.sty usage.
2. Modified newtx.sty and newtxtext.sty to ensure that default effects
   of \mathsf and \mathtt are the same in both cases, and to ensure that
   in both, the prior loading of a sf or tt text font would result in
   those being used for \mathsf, \mathtt without any further interventions.

Link: [1] https://mirrors.ctan.org/fonts/newtx/README
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 SMPdesign/DiningPhilosopher4part-b.tex | 2 +-
 SMPdesign/DiningPhilosopher5.tex       | 2 +-
 SMPdesign/DiningPhilosopher5PEM.tex    | 2 +-
 SMPdesign/DiningPhilosopher5TB.tex     | 2 +-
 perfbook-lt.tex                        | 1 +
 5 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/SMPdesign/DiningPhilosopher4part-b.tex b/SMPdesign/DiningPhilosopher4part-b.tex
index 2d1c307e..c004aa14 100644
--- a/SMPdesign/DiningPhilosopher4part-b.tex
+++ b/SMPdesign/DiningPhilosopher4part-b.tex
@@ -5,7 +5,7 @@
 \usepackage{pst-eps}
 \usepackage{multido}
 \usepackage{calc}
-\usepackage[helvratio=0.9]{newtxtext}
+\usepackage[scale=0.9]{tgheros}
 \renewcommand{\familydefault}{\sfdefault}
 
 \begin{document}
diff --git a/SMPdesign/DiningPhilosopher5.tex b/SMPdesign/DiningPhilosopher5.tex
index a892f11b..9b471f70 100644
--- a/SMPdesign/DiningPhilosopher5.tex
+++ b/SMPdesign/DiningPhilosopher5.tex
@@ -5,7 +5,7 @@
 \usepackage{pst-eps}
 \usepackage{multido}
 \usepackage{calc}
-\usepackage[helvratio=0.9]{newtxtext}
+\usepackage[scale=0.9]{tgheros}
 \renewcommand{\familydefault}{\sfdefault}
 
 \begin{document}
diff --git a/SMPdesign/DiningPhilosopher5PEM.tex b/SMPdesign/DiningPhilosopher5PEM.tex
index 55db3773..4c77f482 100644
--- a/SMPdesign/DiningPhilosopher5PEM.tex
+++ b/SMPdesign/DiningPhilosopher5PEM.tex
@@ -5,7 +5,7 @@
 \usepackage{pst-eps}
 \usepackage{multido}
 \usepackage{calc}
-\usepackage[helvratio=0.9]{newtxtext}
+\usepackage[scale=0.9]{tgheros}
 \renewcommand{\familydefault}{\sfdefault}
 
 \begin{document}
diff --git a/SMPdesign/DiningPhilosopher5TB.tex b/SMPdesign/DiningPhilosopher5TB.tex
index c2015991..259d0f0f 100644
--- a/SMPdesign/DiningPhilosopher5TB.tex
+++ b/SMPdesign/DiningPhilosopher5TB.tex
@@ -5,7 +5,7 @@
 \usepackage{pst-eps}
 \usepackage{multido}
 \usepackage{calc}
-\usepackage[helvratio=0.9]{newtxtext}
+\usepackage[scale=0.9]{tgheros}
 \renewcommand{\familydefault}{\sfdefault}
 
 \begin{document}
diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 7c4ad53a..fd598a56 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -14,6 +14,7 @@
 % A more pleasant font
 \usepackage[full]{textcomp} % use symbols in TS1 encoding
 \usepackage{lmodern}
+\usepackage[scale=0.9]{tgheros}
 \usepackage[T1]{fontenc} % use postscript type 1 fonts
 \usepackage[table,svgnames]{xcolor} % newtxtext v1.73 loads xcolor without options
 \usepackage[defaultsups,helvratio=0.9]{newtxtext} % use nice, standard fonts for roman

base-commit: b0f4bfe76079bd952351ccd925832b161889e0ae
-- 
2.34.1

