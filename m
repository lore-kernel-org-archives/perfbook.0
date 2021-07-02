Return-Path: <SRS0=JVx/=L2=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=REDxcIULISyITkabgaW8WHxABT0wyd3XhUOpBnG2YQc=;
        b=swJGBmnITFdfEFwuZykkwtPbWepVnGd3lMTjibRwJQGLDRQ+aRu1eoKCCVnP+hFHxG
         8P6PTbpSOha/aUjxRnQZhHKgdbvwO67GrtEcitQTq7Xd+/Fj+TbvbpWitq1QFEhq8rNd
         1b5sJB8+R8Vh7/NyQlLc8OdU0SJPKesbIhr5FuT+z4NaqAxfGEWpco1yhBvY8rQKHDce
         Inlcuc0HRMsVjc4HMqonNLaLOFWPMzZx1Me2GiBy06VIb+2G5ZX+iKxbRPaatv1Q9WLs
         LwdrHKfxzJhULfjucovTVnURJRk05Q8ScVmI2EWnaB2r74kypslKc6g7q1uQHEpDdQbL
         4U1g==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] future/htm: Fix typo (missing '\' of \IXalt)
Message-ID: <3b7aac15-128e-56d4-6662-9fa686f94dd1@gmail.com>
Date: Fri, 2 Jul 2021 18:49:39 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Fixes: de25a117a9c6 ("index: Add index and acronym tags, take one")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

I fat-fingered this one in the big patch.
I'm thinking of adding some rules in the check script to catch
this sort of typo.

        Thanks, Akira
--
 future/htm.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/future/htm.tex b/future/htm.tex
index dc67ba23..7bff0f99 100644
--- a/future/htm.tex
+++ b/future/htm.tex
@@ -252,7 +252,7 @@ write~\cite{RaviRajwar2012TSX}.
 schemes~\cite{CScottAnanian2006,KevinEMoore2006}
 use DRAM as an extremely large victim cache, but integrating such schemes
 into a production-quality
-IXalt{cache-coherence}{cache coherence} mechanism is still an unsolved
+\IXalt{cache-coherence}{cache coherence} mechanism is still an unsolved
 problem.
 In addition, use of DRAM as a victim cache may have unfortunate
 performance and energy-efficiency consequences, particularly
-- 
2.17.1

