Return-Path: <SRS0=GtJ7=RW=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2G2PrMSgT+9YKucOVUrN3Ff8gLpnzJWrYl7tWf8A/QE=;
        b=i30ExaXd8tcJLChUfRD8a9wXDLNlPWJJb//EUXwahkxLztIVTybiijRlcqjWBhKfdN
         2csABCgsEAk0lJTH/nDBZ8KhGxXZdM/qzjJKo/wtjGuBphC2mS0s3G2+mCaya1qv+Q67
         WJIxPpkCVvmXGWRBBqFuIOUT1HiVucJ22W3W9i4no0TvSc0ClHZoajzj/q79yxRe5i5C
         T1yrn1axinNYYVWyimHdirh7zixd7L7e/XMrT3topgm1A75x2F1Lzh8EeNLnOoNxJXNa
         Yw/PyIMPXWs+FKWPr2IoZCqmKLYB4Mb75XXHlC+N/JxHn6RMtJdf2pD5M+ITC60Xdegk
         OCpw==
Subject: [PATCH RESEND -perfbook 05/10] defer/rcuapi: Fix typo
 'get_nulls_values()'
References: <d61bf71a-d3ed-1561-62ee-15d4537443da@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <f9515da9-3de4-65c9-c68d-96266d4cd6f2@gmail.com>
Date: Thu, 6 Jan 2022 16:38:36 +0900
MIME-Version: 1.0
In-Reply-To: <d61bf71a-d3ed-1561-62ee-15d4537443da@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuapi.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index 6cd30c0f..ecbd4863 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -683,7 +683,7 @@ if passed an \co{hlist_nulls} \co{NULL} pointer) to determine when
 it reaches the end of a list, and the \apik{get_nulls_value()} function
 (which returns its argument's \co{NULL}-pointer identifier) to fetch
 the type of \co{NULL} pointer.
-When \co{get_nulls_values()} returns an unexpected value, the reader
+When \co{get_nulls_value()} returns an unexpected value, the reader
 can take corrective action, for example, restarting its traversal from
 the beginning.
 
-- 
2.17.1


