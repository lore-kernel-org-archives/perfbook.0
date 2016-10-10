Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=cnDSvtZ3Y4GSZDlcaxqltRNYSaooJWj2CeoJZkb0ngo=;
 b=c+Tx7w9sxXH3Kq/bOyA5BKDVu8Fl/+/fh1XJ8JqrlxvkDBSsah7KNgzMm4Yzf/nd/g
 srLGsemjuzQogSnDB+ZI1cU2I+EEmBtu30F/GLKdzldI++5X+ifXJFP4gMc2ecLDSYbJ
 x5Q3zcYmZwtSnChTUbO7ez00uXvif4HhB06GaftpR6lQP90r6rz4IGmOHJGa2KS05RUg
 qfxjdJsc85404k6maKb3HgvuNk94s/LTPu6Fu83JBgtIcG0AWh104DO2HvGLchEZdo0l
 5LEn0mHdgJQKECUcTaTHQ/vjhs7fp/WW0lcj2b2Gr0IWEolrpWE/zMj8m+HVjx422ttv
 d3pA==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 7/8] together: Fix a contextual typo
Date: Tue, 11 Oct 2016 08:07:37 +0900
Message-Id: <20161010230738.14452-8-sj38.park@gmail.com>
In-Reply-To: <20161010230738.14452-1-sj38.park@gmail.com>
References: <20161010230738.14452-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 together/applyrcu.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/together/applyrcu.tex b/together/applyrcu.tex
index 60d489c3b7bb..02d36e6ba5f3 100644
--- a/together/applyrcu.tex
+++ b/together/applyrcu.tex
@@ -606,7 +606,7 @@ can be freed.
 	\item	Use \co{rcu_assign_pointer()} to point \co{->mp}
 		back to the old embedded \co{->meas} field.
 	\item	After another grace period elapses, free up the
-		new \co{measurement} field.
+		new \co{measurement} structure.
 	\end{enumerate}

 	This approach uses a heavier weight update procedure to eliminate
-- 
2.10.0

