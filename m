Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HymVSod9C3nWvi1h66DrditmpihX6viMirzNZYxPo1s=;
        b=WbnYzy18DGehHsRAWKpv0KQdVZRCzBs3tpB0SvYPqFPHUwOY+4TPyQKB8Q2Y0sHnQa
         2/3722hmH466v/gqthHIP481kL6rco3N+f6sgORmxvJJqSXl7hDwORXgUayV+290Tzvi
         cXUM9ErJT6aEuyNvWr0NfT6SELRdN4jpDvOKdOKUHSsnN4ccySsW8AbkT6R5JkydkH/L
         T2UIM0HlkrEo76ovRAJuzEhENOoZWeWPwW1jHswqM/nyG3ycnFQtmV133yc0+amCY74N
         6GCRu1NUzZ7mLL4Y+SAaH68Rz+o4NJ9+B0JQXiTWNXVsMEso5OKrMpDsoyoZWffZ/N9T
         YgJQ==
Subject: [PATCH 2/8] CodeSamples/formal: Add C-RCU-remove.litmus
References: <a0be104e-0043-36bb-a639-4ecd6db77d59@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <d0fbcd4c-f6a5-4cc1-2338-fa3256986a3a@gmail.com>
Date: Thu, 1 Nov 2018 00:10:52 +0900
MIME-Version: 1.0
In-Reply-To: <a0be104e-0043-36bb-a639-4ecd6db77d59@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From aafc555fe798bcf3c65d0092ca5c8b2d4f6880d3 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 31 Oct 2018 07:40:45 +0900
Subject: [PATCH 2/8] CodeSamples/formal: Add C-RCU-remove.litmus

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/herd/C-RCU-remove.litmus | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 CodeSamples/formal/herd/C-RCU-remove.litmus

diff --git a/CodeSamples/formal/herd/C-RCU-remove.litmus b/CodeSamples/formal/herd/C-RCU-remove.litmus
new file mode 100644
index 0000000..0dc806e
--- /dev/null
+++ b/CodeSamples/formal/herd/C-RCU-remove.litmus
@@ -0,0 +1,27 @@
+C C-RCU-remove
+//\begin[snippet][labelbase=ln:formal:C-RCU-remove:whole,commandchars=\\\@\$]
+
+{
+	int *z=1; (* \lnlbl[tail:2] *)
+	int *y=2; (* \lnlbl[tail:1] *)
+	int *x=y; (* \lnlbl[head] *)
+}
+
+P0(int *x, int *y, int *z)		//\lnlbl[P0start]
+{
+	rcu_assign_pointer(*x, z);	//\lnlbl[assignnewtail]
+	synchronize_rcu();		//\lnlbl[sync]
+	WRITE_ONCE(*y, 0);		//\lnlbl[free]
+}					//\lnlbl[P0end]
+
+P1(int *x, int *y, int *z)		//\lnlbl[P1start]
+{
+	rcu_read_lock();		//\lnlbl[rl]
+	r1 = rcu_dereference(*x);	//\lnlbl[rderef]
+	r2 = READ_ONCE(*r1);		//\lnlbl[read]
+	rcu_read_unlock();		//\lnlbl[rul]
+}					//\lnlbl[P1end]
+
+//\end[snippet][locationslabel=locations_,existslabel=exists_]
+locations [0:r1; 1:r1; x; y; z]
+exists (1:r2=0)
-- 
2.7.4


