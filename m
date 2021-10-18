Return-Path: <SRS0=U37W=PG=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=yPmOw43upX/V1t/3a+HECkzo6iIo8J54O+hmCyTSfHQ=;
        b=mZbTlgOItXsO3dzDJYry2T5WmVzoxX5yQ9jhmHRLdEuqFbaZUkrKwv0bPXPl3XpPFE
         9mkb1yHF/T6YGpUsnE+X1FslHO9RdckzHNNCpi9H8AqiJgdhISl1KkP5VwUq8/+ZAOyz
         oio3+RNMUwezytgrqkuj2ghGUBsgCau17VQd9H47koFKGS5JGIoDbi/eFXGKaaFwtBzW
         J/fs2rXrU9XsObc1rSg/4oPsBFYjD+1K/Navlv0OOxlayKzU/uIWErZGPqBtEq5xrrAs
         x02s3OO1/sJs9ST1k3Zh58ipvfqiD75ykXLW6pw5DNPbMfq4dnuJsR7nP4xMcPKqPkmV
         R+9g==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 1/5] toolsoftrade: Consistently add parentheses to function names
Date: Mon, 18 Oct 2021 10:44:35 +0200
Message-Id: <20211018084439.7112-1-sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Parentheses are appended to all function names including 'mythread()',
but one case is not.  This commit adds parentheses there.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 toolsoftrade/toolsoftrade.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index c9f5b399..b2694da2 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -344,7 +344,7 @@ ID of the thread to be created, the second \co{NULL} argument is a pointer
 to an optional \co{pthread_attr_t}, the third argument is the function
 (in this case, \co{mythread()})
 that is to be invoked by the new thread, and the last \co{NULL} argument
-is the argument that will be passed to \co{mythread}.
+is the argument that will be passed to \co{mythread()}.
 \end{fcvref}
 
 \begin{listing}
-- 
2.17.1

