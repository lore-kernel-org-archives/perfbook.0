Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=TTBRzSwfYEjUoPFNOlTNfKqw2N9O4frkPLqXBU/OU20=;
 b=Deru2Zl285Toa53G3KFoSJJ1/QZ4EMTT/cMDPYWari6O2ZbTCTsyQ2CrKObQAfy9KU
 +03O4bmEQyajC85An6cuW672ZpSBab/c4N0TLw+BKLDwl+MdLl4dN2ufHtEkBmiABMWL
 DroTa1KJeSa2fFxDEfRdmaBzbOG6xtgkrjg9NNPSz0kwiQ0Ly73e1A+fYulYPYGeMHIc
 0TrfYHV0uc6lrKW5xklNI8MBhJ3CfpLupgQUjwgS130mquMrCcsRWq6U7kkmH/JCEbEY
 SdboPm8IaflRzzx/9VYW1vQOo/Ye9lh6bp96l8k5kEZ553FlkkVaxekXnnw/gQu4TXYZ
 m5Eg==
Subject: Re: [PATCH 0/6] Add targets for alternative fonts
References: <9229c60d-0468-7632-e59e-3921f0e46f54@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <8b645c3e-ff44-de18-1ae8-c985b1b4cea3@gmail.com>
Date: Wed, 19 Oct 2016 06:59:34 +0900
MIME-Version: 1.0
In-Reply-To: <9229c60d-0468-7632-e59e-3921f0e46f54@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 0cfe68cfd9e7c5413c26f25408ea3cb78f1a334c Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 9 Oct 2016 17:59:03 +0900
Subject: [PATCH 1/6] Separate font package declarations

This is a preparation of font-choice tweaks to follow.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook.tex | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/perfbook.tex b/perfbook.tex
index 66c93fe..87d5b53 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -5,7 +5,9 @@
 % A more pleasant font
 \usepackage[T1]{fontenc} % use postscript type 1 fonts
 \usepackage{textcomp} % use symbols in TS1 encoding
-\usepackage{mathptmx,helvet,courier} % use nice, standard fonts for roman, sans and monospace respectively
+\usepackage{mathptmx} % use nice, standard fonts for roman,
+\usepackage{helvet}   % sans serif,
+\usepackage{courier}  % and monospace respectively

 % Improves the text layout
 \usepackage{microtype}
-- 
2.7.4


