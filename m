Return-Path: <SRS0=9lAq=ZD=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=yE4TbS3BL+X/3kzuAB+Ysa5jHYhaODlHrQbIdT5y1Nc=;
        b=CUFmYLDI6uBstYJBftVNbnaYzWoa8VisZAFVrZ0xRJRrLWHO4iIoGs6Vu7ijYF2RyY
         56z0RcHbG2i9aNdlFla+7D1IPmAs7lK2GwUiao4KYgVb1lH62th/fkV4DLRgXnGmpTLs
         MsPEhWf111TfFNZ5vS2ZMUGNpMMFwvw+i6WyC/lWLlWMSfdyjXLHUS1GXDuoAD1Bm7ra
         MmZtfDrewlNyz+9Wc3tqxgJVuh9TjzfPdR7+v/qmQ3zs6t7YDM4auh3b35r6aiH8gPuH
         HzDLw6wSPy2d2+cU0Nqn9sZRU/eCC4AWuwt9iwIKfI2W3MkjVF8iix2whnRMpDtMUoTM
         4fNQ==
Message-ID: <3e1afa78-865b-6fb4-ca69-36529f1a8e69@gmail.com>
Date: Wed, 31 Aug 2022 23:36:22 +0900
MIME-Version: 1.0
Subject: [PATCH] defer/rcuusage: Remove redundant back quote
Content-Language: en-US
References: <20220829135533.GA1839874@paulmck-ThinkPad-P17-Gen-1>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20220829135533.GA1839874@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This "`" looks redundant.
Remove it.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuusage.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index cc4e73d9c014..eba1033bbbc3 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -1713,7 +1713,7 @@ RCU's temporal synchronization is provided by the read-side markers,
 for example, \co{rcu_read_lock()} and \co{rcu_read_unlock()}, as well as
 the update-side grace-period primitives, for example, \co{synchronize_rcu()}
 or \co{call_rcu()}.
-The` spatial synchronization is provided by the read-side
+The spatial synchronization is provided by the read-side
 \co{rcu_dereference()} family of primitives, each of which subscribes
 to a version published by \co{rcu_assign_pointer()}.\footnote{
 	Preferably with both \co{rcu_dereference()} and
-- 
2.25.1


