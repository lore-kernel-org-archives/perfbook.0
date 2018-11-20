Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=iOd3R2zGcpnf9sxWlSGQrLeGACEY8atlEmfRk/yy6fo=;
        b=Z4pKnKkvPD5mGJmzzf1kzCPhYgSJUyQLPPXojTZgczPJOTZxeBopApFcTHfaw+TCSq
         haiEex4Bd7T2IbSgrMNS65PTQDXsX6pZtab+zwHdas2Di4kp8etsdxoazhbmtEn8seVQ
         tPtaPo7PE6KT6NhIbwRX5jUtkv9CfRBVlXOCu2ul7Lea3rgTKLE0KOrqcMbh8oom5wlH
         mBEeIcENUhNUN9xaLpWwHFqfuEwJSBTKxMDaHCCYl1fICmpbkAu6wjf9JwZgf3IjO9Iv
         N7O89zTVCPchAPKy5lc0vvasschF5oyycM53sMSu2bwcyjJv2112YJnRCifkRU8J4+Ud
         HG+Q==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 4/7] toolsoftrade: Fix a typo for function name
Date: Tue, 20 Nov 2018 09:00:54 +0900
Message-Id: <20181120000057.389-4-sj38.park@gmail.com>
In-Reply-To: <20181120000057.389-1-sj38.park@gmail.com>
References: <20181120000057.389-1-sj38.park@gmail.com>
To: paulmck@linux.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

---
 toolsoftrade/toolsoftrade.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 0fe1038..96014b9 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -1741,7 +1741,7 @@ void work_until_shut_down(void)
 However, there are exceptions, for example as shown in
 Listing~\ref{lst:toolsoftrade:C Compilers Can Fuse Stores}.
 \begin{lineref}[ln:toolsoftrade:C Compilers Can Fuse Stores]
-The function \co{shut_it_down(void)()} stores to the shared
+The function \co{shut_it_down()} stores to the shared
 variable \co{status} on lines~\lnref{store:a} and~\lnref{store:b},
 and so assuming that neither
 \co{start_shutdown()} nor \co{finish_shutdown()} access \co{status},
-- 
2.10.0

