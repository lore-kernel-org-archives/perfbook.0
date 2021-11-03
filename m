Return-Path: <SRS0=/H/q=PW=gmail.com=zhouzhouyi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bVIW3F9mfgAUtxbEv4dzSj1tPPOHvZqGdnyWAx0xPbg=;
        b=PFK5IzjwD6CBxDRtrp0bMVwoHTXBn1ZjOMAIp1I6QWxJJ3AyHpSvfCabLLGye3HXYF
         R39AQSBYVfB5TtypZLMZ1ZdOW3PG/yQ9s3hxVtFDyY7pyp3EdhVcXjFqbP+Kp7Q3rPZ9
         VGeIxkTuU1iYjrnRblYvRSMq5+865aYwKCjFsRd4FM+jhxXc3+UpFbpzARAg3LgrtVyr
         vK2Rod9IV5WJU7pjrlbM+nLIvD8f4Fae2vmET2AnziH0/1wIoebdNbhI3X/INSDaL5rJ
         twB/MvFtMxQmbUdKp2aD1rrZlyKVIb+3TlNlc31bdQvpWuyT5FSw/7uWE8yt+wGXbU9D
         LIeA==
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: [PATCH-perfbook] future: fix a typo in answer to QQ 17.3
Date: Wed,  3 Nov 2021 15:56:45 +0800
Message-Id: <20211103075645.19983-1-zhouzhouyi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org, perfbook@vger.kernel.org, luyang.co@gmail.com
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
List-ID: <perfbook.vger.kernel.org>

In answer to Quick Quiz 17.3, MV-RCU should be MV-RLU.

Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
---
Hi Paul,

In answer to Quick Quiz 17.3, MV-RCU should be MV-RLU.

Thanks Zhouyi
--
 future/tm.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/future/tm.tex b/future/tm.tex
index ce071bc8..50e7d6dc 100644
--- a/future/tm.tex
+++ b/future/tm.tex
@@ -1047,7 +1047,7 @@ internally~\cite{UCAM-CL-TR-579,KeirFraser2007withoutLocks,Gu:2019:PSE:3358807.3
 	\end{enumerate}
 
 	It is surprising that the anonymous reviewers of this paper did
-	not demand an apples-to-apples comparison of MV-RCU and RCU\@.
+	not demand an apples-to-apples comparison of MV-RLU and RCU\@.
 	Nevertheless, the authors should be congratulated on producing
 	an academic paper that presents an all-too-rare example of good
 	scalability combined with strong read-side coherence.
-- 
2.25.1

