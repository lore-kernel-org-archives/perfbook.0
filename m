Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=4XSDY1C+UxpJjMzZwhNwshjx3iWDZp2IFQSbBQcvRsY=;
 b=Wkf7tLk9L03262zbuL2Xkj0picniA/Izv5Ge3c9jy/gTyKaoF4aBpA7YG1MRuUNYdi
 NCpBsh+TQzDkbXcK6E4OWCczaVBWrijWuyGc+fURzV+yw/R9e/cl8u2eUhMnadvtNLC8
 1zUkGz8W5ah8lKxtkZib6sRyvew3f82i5LL3EaakaeZTdQ7XRjgz+S9nxv3Xr/ev+1l4
 F5vX0R10t70BQiUoY82pdUmfkEHb/IHvLFepc09cgur60oYscAO/NtMksxjyGMOT3Bso
 YOaEkSoPntyvF+fahS59ClrKSzngNNNgeKmhyOGjYCzg1nGPltTdSIzn6mXoTBCpgurZ
 egDQ==
Subject: [PATCH 2/6] Adjust scale of sans serif font
References: <9229c60d-0468-7632-e59e-3921f0e46f54@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <e6205c15-0a8e-4842-6136-60695d9abcab@gmail.com>
Date: Wed, 19 Oct 2016 07:01:44 +0900
MIME-Version: 1.0
In-Reply-To: <9229c60d-0468-7632-e59e-3921f0e46f54@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 052b26ecc718edba3cc32d611111b1e43c5a23af Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 9 Oct 2016 18:25:21 +0900
Subject: [PATCH 2/6] Adjust scale of sans serif font

In the documentation[1] of "psnfss2e" package, it is stated that the
sans serif font "helvet" should be scaled by 0.92 to match the size
of Times font.

This commit adds the option to do so.

[1] http://mirrors.ctan.org/macros/latex/required/psnfss/psnfss2e.pdf

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/perfbook.tex b/perfbook.tex
index 87d5b53..f808c7f 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -6,7 +6,7 @@
 \usepackage[T1]{fontenc} % use postscript type 1 fonts
 \usepackage{textcomp} % use symbols in TS1 encoding
 \usepackage{mathptmx} % use nice, standard fonts for roman,
-\usepackage{helvet}   % sans serif,
+\usepackage[scaled=.92]{helvet}   % sans serif,
 \usepackage{courier}  % and monospace respectively

 % Improves the text layout
-- 
2.7.4


