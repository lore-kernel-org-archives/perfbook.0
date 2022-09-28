Return-Path: <SRS0=gucT=Z7=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=f3ON6sPw7rVj5K0ocGHdXegtLSQiigIdNkS1/krxn4s=;
        b=NrHNea2OpnHhlzTID3lK2ga33c66uy7axpQOYGnJl9kXeMvnO7j0CB86nITkYc3CdD
         riaRPMqa4XJF8aZewDInY/9OHYPZthQtzmgq3Ib8Ms+nOiS68f6bjKGVHOmSZcGHhCc2
         llCOqM0F5uTjsOZvs/XSU53S1AkjcCidpSmoe+yJ+8mNR1jFRRceZLpjJHpGIrLBmt5Y
         qZ3EhSArcnaimVxjKMg+V5YSd9OaEe2aWUwLPilajITU/4qdWMxft9Holo/MrgEh+1aV
         82RZDWwSlRwOJF2faspiMHKsPi2KEkFL5/mG0XbCoiuXCUVu1E9D9V0jRX3IFOWfU3WR
         OqAA==
Message-ID: <3ca9e48c-3049-1845-a849-d8484c47d645@gmail.com>
Date: Wed, 28 Sep 2022 23:30:40 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 2/2] memorder: Fix typo
Content-Language: en-US
References: <c8ec96f6-f592-36be-3d8a-55030d430caa@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <c8ec96f6-f592-36be-3d8a-55030d430caa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

I don't see any smp_store_release() in P1().
It must be P0(). :-)

        Thanks, Akira
--
 memorder/memorder.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index f85cfe6ca702..a0a87d0a8bca 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -2372,7 +2372,7 @@ The only code difference is that
 has an additional \co{P2()} that does an \co{smp_store_release()} to
 the \co{x2} variable that \co{P0()} releases and \co{P1()} acquires.
 The \co{exists} clause is also adjusted to exclude executions in which
-\co{P2()}'s \co{smp_store_release()} precedes that of \co{P1()}.
+\co{P2()}'s \co{smp_store_release()} precedes that of \co{P0()}.
 
 Running the litmus test in
 \cref{lst:memorder:A Release-Acquire Chain With Added Store (Ordering?)}
-- 
2.25.1


