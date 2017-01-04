Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=g0S0i+DMop7In8uhZAvNg6f+TfpYXf5xFUEO79mk2fk=;
 b=uLTf7CX25oGi1AimwfcgPx7gTpgeALjo42aMJ7wNZPyDNzKIZneEOxnRn+BokhonJq
 ht8e4SsogB2+Fp6wvcQWv0HjpMvn7chh1V5r2LeY2txzgBwgrA3pLFO9fYzKjgxgTMUl
 sabKXBlrs3z9jOK3+D2rpboJGNFwiMI1F6ilac5EWZUZFunTLYSrc/nR30SfGYVoeb56
 8pq8Nkpq374uwlyZB549Xy/iE1/f1Fj9kZL2ote3pNREQNCZDcIKDggiptn7Tri/f2KM
 0P08gDV1GZP1+UYGd3dzJVAj/5dm1ty1FkyC1ukGmqkSYVVxSmw144A/O7CYA8CB/CbO
 Wd9A==
Subject: [PATCH 2/2] Fix typo smb_wmb() -> smp_wmb()
References: <a054d07b-3b69-25ce-aab4-c294dc3b6bcd@gmail.com>
 <20170104014004.GG3742@linux.vnet.ibm.com>
 <97f7304e-d989-1b21-0fed-465d540dd66d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <3f9548a6-13bb-2ef3-4c29-1f7abe01d1cb@gmail.com>
Date: Wed, 4 Jan 2017 20:37:50 +0900
MIME-Version: 1.0
In-Reply-To: <97f7304e-d989-1b21-0fed-465d540dd66d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From daa13e2a26b5470ed7b6082998aabdfd73cde517 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 4 Jan 2017 20:11:07 +0900
Subject: [PATCH 2/2] Fix typo smb_wmb() -> smp_wmb()

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/whymb/whymemorybarriers.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index 0956226..70e1d30 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -1465,7 +1465,7 @@ All variables are initially zero.
 	\hline
 	\hline
  1 &	a = 1; &			& \\
- 2 &	\tco{smb_wmb();}&		& \\
+ 2 &	\tco{smp_wmb();}&		& \\
  3 &	b = 1;		& while (b == 0); & while (b == 0); \\
  4 &			& \tco{smp_mb();}& \tco{smp_mb();} \\
  5 &			& c = 1;	& d = 1; \\
-- 
2.7.4


