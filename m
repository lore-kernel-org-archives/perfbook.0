Return-Path: <SRS0=ReyI=FK=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Bbit0gH+3SfeloMGRxE12u7HDgvNnJA1fSz443jYhk8=;
        b=CNhonYs90DT+9bt/g6vhnhcOY24MQHD2gJBLi5Hk71TV3jeGslxeqNH7YGSWVRqaon
         8cKYQvzvs98pveXG0F2HbogGuF28O+MnCilFYgBG97bBIGx9UvsMz0+0ktsBLAXZNOtv
         GEarEanmh+WYcltU082rTus1CZ0t7pDoMZN8V/JvPlxgQBpqqQgePox3ohBKOw+K8rsu
         D+eJhREhprtwR+CseCS+NfZ3QGMF217+A0I+QSYlAovnPdTsABeevHtzj1isRVvcCxq9
         vSH0ngrxD9aMhPaxR+ROdeFmntdZo10A98q66cjDFDGXGSoz6uMP8sJvYYJYVEgkbcdi
         TWiw==
Subject: [PATCH -perfbook v2] whymb: Fix typo in variable name
References: <7e76cd30-1879-bdff-f693-e0671c8d77d4@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <999131aa-68ff-8774-8172-d804dcde3cea@gmail.com>
Date: Mon, 7 Dec 2020 07:40:26 +0900
MIME-Version: 1.0
In-Reply-To: <7e76cd30-1879-bdff-f693-e0671c8d77d4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Motohiro Kanda <kanda.motohiro@gmail.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From ff659ff1a4927bf0ebfbe5a28a3edc208c688e2d Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 7 Dec 2020 07:36:07 +0900
Subject: [PATCH -perfbook v2] whymb: Fix typo in variable name

It is the variable "b" that CPUs 1 and 2 observe in Listing C.3.
This typo was pointed out by Motohiro in his Japanese translation [1].

[1]: https://sites.google.com/site/kandamotohiro/perfbook-d/perfbookappendixc

Also add a couple of nbsps ("CPU~1 and 2" -> "CPU~1 and~2").

Cc: Motohiro Kanda <kanda.motohiro@gmail.com>
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
v1 -> v2: Add a couple of nbsps

 appendix/whymb/whymemorybarriers.tex | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index e6c24f6e..1dae3fc5 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -1506,12 +1506,12 @@ All variables are initially zero.
 
 Note that neither CPU~1 nor CPU~2 can proceed to line~5 until they see
 CPU~0's assignment to ``b'' on line~3.
-Once CPU~1 and 2 have executed their memory barriers on line~4, they
+Once CPU~1 and~2 have executed their memory barriers on line~4, they
 are both guaranteed to see all assignments by CPU~0 preceding its memory
 barrier on line~2.
-Similarly, CPU~0's memory barrier on line~8 pairs with those of CPUs~1 and 2
+Similarly, CPU~0's memory barrier on line~8 pairs with those of CPUs~1 and~2
 on line~4, so that CPU~0 will not execute the assignment to ``e'' on
-line~9 until after its assignment to ``a'' is visible to both of the
+line~9 until after its assignment to ``b'' is visible to both of the
 other CPUs.
 Therefore, CPU~2's assertion on line~9 is guaranteed \emph{not} to fire.
 
-- 
2.17.1


