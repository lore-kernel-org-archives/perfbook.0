Return-Path: <SRS0=XMwo=HJ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=z0GZ2iE9spHPmT6ALrO6dlBxtqUVtb85JOdqCXCvb4I=;
        b=AABmMbnM60mAKtlfuy3SrQn0S60QTk5W+8YgD739VMhFqONV9jcHd1PcNfPeht41IH
         N/uQfXhY2oNAC2Nkf1atRrQ+bZNOp70UbdEu/9iTUrq0AK4HIiNNT5jsT65m6cCdjT+k
         yIW+KBBu4yajhiiLYW62HzIpcwIsDsgDTDNENlwXd8LRHmrVoJxkomznvyBsgawvSBG7
         foPgp/sVTJoBr+UsJZQPRP+zlHNveFW/c8j++sm07aoZjNOoSFVMWQzYpfl1RnGjcbRL
         xjDQufddjH/9LmkGLjrHLJcsoLCnfdLmfoyBz/6LQxJyIVllXLHOoFPrVaGrKuI4JtCA
         3Nbw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 1/3] advsync: Fix duplicate bibliography reference
Message-ID: <21a2baaf-887d-8e98-eaad-f18948e9c377@gmail.com>
Date: Mon, 8 Feb 2021 00:22:29 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Herlihy90 and MauriceHerlihy90a are the same paper.
Use the latter to avoid duplicate entries in Bibliography.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/advsync.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/advsync/advsync.tex b/advsync/advsync.tex
index bfd3737d..6f0dbe35 100644
--- a/advsync/advsync.tex
+++ b/advsync/advsync.tex
@@ -86,7 +86,7 @@ which is described in the following section.
 	  it's supposed to do.}
 	 {\emph{Robert A. Heinlein}}
 
-The term \emph{non-blocking synchronization} (NBS)~\cite{Herlihy90}
+The term \emph{non-blocking synchronization} (NBS)~\cite{MauriceHerlihy90a}
 describes seven classes of linearizable algorithms with differing
 \emph{forward-progress guarantees}~\cite{DanAlitarh2013PracticalProgress},
 which are as follows:
-- 
2.17.1

