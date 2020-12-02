Return-Path: <SRS0=7RMV=FG=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=CqSENsbySgt8mWW9g3Admrn7N2BTCF4RP3PENeRfwD8=;
        b=ipIIviBsAQ1ZpVRmqdDt3bmd5jClie7Ga/hC6nczbPoSXcNIv4+f40TcJ9riZzaW2o
         NlhdPtnfDvFb7kFpn0/QBC8P19JjsU6/idO5EI99zq4bx8ceiK8dHIVJDst1mcTAaBDC
         nC83SlKrSE3POR5jdbB9eZRtERT22iZRks8TNCpMc+223bxDWW3rY0snRND3JGpD7Uhv
         lvX+xXambMAZx9F1Hj+J7+yL0cYX9yzrkl8Kn8YpEMGutgTRlYDo4xqXoWY3QvoCWv6M
         BZC6b197lfm4YKql45nSjEQdvCVIoeAkHiYt4hhVAEZ5enWAlQ+mzBON8jTWKT9e2axV
         E9gA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] whymb: Fix description of compiler mischief
Message-ID: <99ea974f-8788-c2e5-5544-e7e708ad2553@gmail.com>
Date: Wed, 2 Dec 2020 23:50:27 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Motohiro Kanda <kanda.motohiro@gmail.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 89ab8426f9821b6a8bf86e9d4f7eb596e0cfed73 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 2 Dec 2020 07:35:08 +0900
Subject: [PATCH -perfbook] whymb: Fix description of compiler mischief

In this code snippet, the assertion can not fire due to different
reasons.
When bar() observes b == 1, the smp_mb() assures a == 1.
When bar() observes b == 0, the while loop will loop forever and
the assertion can't be reached.

This was pointed out by Motohiro Kanda in his Japanese translation
of perfbook [1].

[1]: https://sites.google.com/site/kandamotohiro/perfbook-d/perfbookappendixf10

Cc: Motohiro Kanda <kanda.motohiro@gmail.com>
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

(Cc: Motohiro)

Looks like this inconsistency in the Answer to Quick Quiz has
been Motohiro's translation note for quite a while.
(since 2017?)

He contributed to perfbook in the past.  There is a couple of
commits with his Reported-by.

Motohiro, do you mind if I submit patches to Paul on behalf of
you like this?

And I think Paul is likely to do some wordsmithing on top of
this patch. ;-)

        Thanks, Akira
--
 appendix/whymb/whymemorybarriers.tex | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index dff7fafc..301342f3 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -1152,7 +1152,10 @@ void bar(void)
 }
 \end{VerbatimN}
 
-	Given this optimization, the assertion could clearly fire.
+	Given this optimization, the code would behave in a completely
+	different way than the original intention.
+	If \co{bar()} observed \qco{b == 0}, the assertion could not
+	be reached due to the infinite loop.
 	You should use volatile casts or (where available) C++
 	relaxed atomics to prevent the compiler from optimizing
 	your parallel code into oblivion.
-- 
2.17.1

