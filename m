Return-Path: <SRS0=NUH/=BR=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685284662; x=1687876662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1zi7NWUuZg+j/hWaLg4QIqz1GVOOHtja6CVqtkxQSsk=;
        b=JYNyGR7MxAyXXtUMKpwRsWdHMCLyil8+tzDtr7wPDfYgAdEMwtWnqhQbEYsvBiEY6I
         WtzaE5FWDHy8lJyP+d1lM4epW204MwldKV6/e3MHg4fszm+ATItJN1+krKWBera+pBFH
         /tS1roo/relksezUjHETnH/pjItm99UrwWVDm2hL0XDEwmKg+OU1wHrbB04L3dpgUxMw
         tpcVzzFUy15D2BzL6k0OSgKsBmljM2XoULqOWW1GkmDs+3gvA+YinRWfDftTcJNK+O+9
         oLHHlie2p2kk/45auclJgLqZIoFAYm7z8ylyk2X0Q5cBIxmGcJWYCj72vfZpcPqppZ1B
         hFzg==
From: Alan Huang <mmpgouride@gmail.com>
Subject: [PATCH 2/2] together: Remove wrong content
Date: Sun, 28 May 2023 14:37:29 +0000
Message-Id: <20230528143729.15201-2-mmpgouride@gmail.com>
In-Reply-To: <20230528143729.15201-1-mmpgouride@gmail.com>
References: <20230528143729.15201-1-mmpgouride@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Alan Huang <mmpgouride@gmail.com>
List-ID: <perfbook.vger.kernel.org>

In count_unregister_thread, both adding the counter to total and NULLs
the exiting thread's counterp[] array element happen before publishing
the newly allocated cap. Therefore, count_unregister_thread() can not
result in the outgoing thread's work to be double counted.

Signed-off-by: Alan Huang <mmpgouride@gmail.com>
---
 together/applyrcu.tex | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/together/applyrcu.tex b/together/applyrcu.tex
index 1e69fe3e..09a265f7 100644
--- a/together/applyrcu.tex
+++ b/together/applyrcu.tex
@@ -151,15 +151,6 @@ is invoked by each newly created thread.
 	So, interestingly enough, when adding a new thread, this
 	implementation gets the effect of allocating a new structure,
 	but without actually having to do the allocation.
-
-	\begin{fcvref}[ln:count:count_end_rcu:whole:unreg]
-	On the other hand, \co{count_unregister_thread()} can result
-	in the outgoing thread's work being double counted.
-	This can happen when \co{read_count()} is invoked between
-	\clnref{add,null}.
-	There are efficient ways of avoiding this double-counting, but
-	these are left as an exercise for the reader.
-	\end{fcvref}
 }\QuickQuizEnd
 
 \begin{fcvref}[ln:count:count_end_rcu:whole:unreg]
-- 
2.34.1

