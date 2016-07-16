Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=iiUKdkwVxfXZJJIbVO2/fSEiYtcozY/YInjGxXGYcrs=;
 b=Krqwl0l9mLCgCOdU+0PeM0J6LMjmLIdY8ou9IggknsqN6OuNUxWI9jwtDG7K+fR983
 WEXjMchCVvkIRYalB1KeDKHcTXE77CdYwtm0AJwpbvPfDv2anYnVQT5yYNrZgssgCtrl
 ozo7KmGxmEabv330bi60tYhyJLpK3FMzke2zYo0tZrOw0P2nQf8fsz9R+f1IKg1jzPrG
 fjiogCFcg1gkR92kG9/0JZhlkiIl/gI2VPTQSwF4LbG3mLaWpd4FXJQoVZJWQ3g+RgnM
 PMovx+xi9EGdEHASid7sDNFWqxI5kaIJekYZTVpmwEJxkHaOm0FyY5U9+F9tyuJ9dfxv
 aVpg==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 3/4] defer/whichtochoose: Trim a sentence
Date: Sat, 16 Jul 2016 16:58:49 +0900
Message-Id: <1468655930-9894-4-git-send-email-sj38.park@gmail.com>
In-Reply-To: <1468655930-9894-1-git-send-email-sj38.park@gmail.com>
References: <1468655930-9894-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 defer/whichtochoose.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
index 648cdc8..884de9d 100644
--- a/defer/whichtochoose.tex
+++ b/defer/whichtochoose.tex
@@ -135,7 +135,7 @@ capable of unconditionally acquiring references.
 The entry for sequence locks is ``N/A'' because, again, sequence locks
 detect updates rather than acquiring references.
 Reference counting and hazard pointers require that traversals be
-restarted from the beginning should a given acquisition fail because
+restarted from the beginning if a given acquisition fail because
 the currrent object might be removed and all of its
 possible successsors might be not only be removed, but also freed.
 For example, when using reference counting or hazard pointers to
-- 
1.9.1

