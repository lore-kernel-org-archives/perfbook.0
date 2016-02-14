Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=from:to:cc:subject:date:message-id;
 bh=Ewf74/FtQIs8gP6vW5J4xZWutUGr7fPfwS3WCE8H2Tw=;
 b=dTabxxELJzIAZMkq232XGIdbDPDigXsG1gdn86JNJeKQJBTmJpW84M8+E328q18bgV
 i+tptU0pz7waJyY5YY3zPtGM9KQ8becBAQLHf7robDJogsSBSpdBXplfqUQ3LdMP/9bW
 66oQ8mZmtR9iU5mhxfvTUYbix3yhQWrEV5nlzBI8w85ih/5QnukkOUBjgUrfWmh0ZPmx
 Zg0bMpFqj78IktQMh5FTcRTKCMlVbFUvNs5ImnJ1Oz4JNlwb+ywLUaWkeHvUWdrhSHCY
 tLSo/D70TZ9TGHYmTT5Fl4HzhgqvYZnihHOIlEqIVoJ78CpIOUW+NaYlihs+AY21lqG/
 Q1Vw==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH] toolsoftrade: add missed closing parenthesis
Date: Sun, 14 Feb 2016 10:54:06 +0900
Message-Id: <1455414846-7123-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 toolsoftrade/toolsoftrade.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 8d54d3a..bfe3c52 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -394,7 +394,7 @@ Figure~\ref{fig:toolsoftrade:Threads Created Via pthread-create() Share Memory}
 The first argument is a pointer to a \co{pthread_t} in which to store the
 ID of the thread to be created, the second \co{NULL} argument is a pointer
 to an optional \co{pthread_attr_t}, the third argument is the function
-(in this case, \co{mythread()}
+(in this case, \co{mythread()})
 that is to be invoked by the new thread, and the last \co{NULL} argument
 is the argument that will be passed to \co{mythread}.

-- 
1.9.1

