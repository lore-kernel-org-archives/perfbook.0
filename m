Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=C+PcDB5C8muDiSgqvaoRCu4XKwfHaWEwUr9/pcBi6nw=;
 b=BW9AejLc9cqj0vqZgnsbHpOVu+OAzms737eLLA6AzT0Q/RzPx8AA2l/dHCqE8jooaH
 BHXZUaa/FsUp1a8bvqCq0UcyFVcCMgzBYRF6+76z/sBF1Y87628U+zO6ANAB+3vUBtuQ
 EiBvPA8DVRQID8myxF9Mgv1qyC6UbkTSu+K62xmlrsxVD8Ftp/SGf2dEW3RJAXdNQxLN
 AvIfmq1YEMmsPABIHBozNlpg2EB9+VJ6XKzv+dh4jQzCpXgJKCWeaIpzq9sNlCQuZbms
 O1O2/MG3K2RdaEZLclFTREjD8kFxO3Ih1ddI6UKtAjps/hG5wwrG1TzccHVSKhkVgFSb
 gCEw==
Subject: [PATCH 3/5] Revert "after: Tweak font size of Figure A.2"
References: <f156a2ae-be14-47d5-c0d8-264f2138cf5d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <4ef5b3c9-5b1f-eb70-df3e-f6e3adace600@gmail.com>
Date: Thu, 5 Jan 2017 09:35:39 +0900
MIME-Version: 1.0
In-Reply-To: <f156a2ae-be14-47d5-c0d8-264f2138cf5d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 8b8635c3158f941fd5ff2d0c3b561c2df52cbc99 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 28 Dec 2016 20:30:02 +0900
Subject: [PATCH 3/5] Revert "after: Tweak font size of Figure A.2"

This reverts commit bc0fd9d40035c09b22d138cf68c2233fde8ce2b8.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/questions/after.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/appendix/questions/after.tex b/appendix/questions/after.tex
index e1802ba..cbba768 100644
--- a/appendix/questions/after.tex
+++ b/appendix/questions/after.tex
@@ -51,7 +51,7 @@ e.g., where time has appeared to go backwards.
 \end{figure}

 \begin{figure}[htbp]
-{ \fontsize{6.5pt}{7.5pt}\selectfont
+{ \scriptsize
 \begin{verbbox}
   1 /* WARNING: BUGGY CODE. */
   2 void *consumer(void *ignored)
-- 
2.7.4


