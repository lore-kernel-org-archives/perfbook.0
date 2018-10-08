Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WY5D8CMCGpUsfxCQ1n34u41w9yP1VmNnw24H3U3IgRc=;
        b=Unp1KHOXDVUB/DGXC63UVLBY55Z4foWs73GD6R8AugEl8yalpuATc66wpcFT/tXq57
         M4sNhSdQg6EHspVN5cvCSSlowQO1lkEvD7vqXv0zupneu6VOpZBtpwHa05dcD2Harq71
         QiuEvIwr33AmGU0jYMJzxVyONUEFr8Wx475Jw6zgkxSLi3NBdzz2GH69Q2ZAzYwJ6ndd
         HxNFKc9n/KA0doDt9FyJkYKNI2wNuofw4ZTifYOE6SwXoMwvE1SrjWUpII2buwnVqq45
         VyFxlwlBdg8avJ7VojQesDYEXDrOV40iXfphbiyEeVmrvy0Gd6YI5W1Q0KVen0XyNhYw
         0uKQ==
Subject: [PATCH 6/5] count: Fix typo (\lnlbl{} -> \lnref{})
References: <9c31cb06-b79f-3b9c-e86a-68fb3840f688@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <358bdd72-581f-e9cc-4277-a48f606caeea@gmail.com>
Date: Mon, 8 Oct 2018 23:02:46 +0900
MIME-Version: 1.0
In-Reply-To: <9c31cb06-b79f-3b9c-e86a-68fb3840f688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 6cd4d087e034532c228589aa82b287233e45ccf8 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 8 Oct 2018 21:44:10 +0900
Subject: [PATCH 6/5] count: Fix typo (\lnlbl{} -> \lnref{})

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Paul,

This fixes a couple of typo in "[PATCH 4/5] count: Employ new scheme for
snippet of count_lim".

        Thanks, Akira
--
 count/count.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/count/count.tex b/count/count.tex
index db2107e..f8c68a4 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -1482,7 +1482,7 @@ These lines form \co{sub_count()}'s fastpath, and, as with
 
 If the fastpath cannot accommodate subtraction of \co{delta},
 execution proceeds to the slowpath on
-lines~\lnlbl{acquire}-\lnlbl{return:gs}.
+lines~\lnref{acquire}-\lnref{return:gs}.
 Because the slowpath must access global state, line~\lnref{acquire}
 acquires \co{gblcnt_mutex}, which is released either by line~\lnref{release:f}
 (in case of failure) or by line~\lnref{release:s} (in case of success).
-- 
2.7.4


