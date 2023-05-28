Return-Path: <SRS0=NUH/=BR=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685284655; x=1687876655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O+wV6xXmZlQqyBW05FSaARf++Dsxuqy1kPcWtTk3l+k=;
        b=clcGbqI1b8W3Ch8tUxscePQV6bjFyaNqvwMOJpoH7U2d1F9iuPNtFnLSqedNXD3c7b
         GaPXQR3u6nNCALdnHkExeEc0O1/K00HrtJhCTRZEdV9bgNq95Zwd/kfaDwezGYt7lOno
         RlYYDb8Ovi2Ihb4eRrQFidrU+GlASnBqj2Lxo90OGW+YeW4JQMpJh4SpbEsO4yQjPCBJ
         sr6a71nn3ZlI0znw8q5L0WwTb8AOWIj7DFzTuW1hjRjAyw8DoJrp83jY3sVrFqwoDCyk
         CH8EgYYkFcl1/4zgDxMsOstp04Qik1VyIIAHmcq61MUwrOMXCRS7U1rAjsAZ2ltT0gva
         smjg==
From: Alan Huang <mmpgouride@gmail.com>
Subject: [PATCH 1/2] CodeSample/count: Use plain access instead of WRITE_ONCE
Date: Sun, 28 May 2023 14:37:28 +0000
Message-Id: <20230528143729.15201-1-mmpgouride@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Alan Huang <mmpgouride@gmail.com>
List-ID: <perfbook.vger.kernel.org>

The cap here has not been published, plain access is enough.

Signed-off-by: Alan Huang <mmpgouride@gmail.com>
---
 CodeSamples/count/count_end_rcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/CodeSamples/count/count_end_rcu.c b/CodeSamples/count/count_end_rcu.c
index 1171f0b6..8fc70611 100644
--- a/CodeSamples/count/count_end_rcu.c
+++ b/CodeSamples/count/count_end_rcu.c
@@ -89,7 +89,7 @@ void count_unregister_thread(int nthreadsexpected)	//\lnlbl{unreg:b}
 	}						//\lnlbl{unreg:alloc:e}
 	spin_lock(&final_mutex);			//\lnlbl{unreg:acq}
 	*cap = *countarrayp;				//\lnlbl{unreg:copy}
-	WRITE_ONCE(cap->total, cap->total + counter);	//\lnlbl{unreg:add}
+	cap->total += counter;	//\lnlbl{unreg:add}
 	cap->counterp[idx] = NULL;			//\lnlbl{unreg:null}
 	capold = countarrayp;				//\lnlbl{unreg:retain}
 	rcu_assign_pointer(countarrayp, cap);		//\lnlbl{unreg:assign}
-- 
2.34.1

