Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Rw+StoOO32GFfkvAD8LF/NNr/sHFNMGkSHT6XDVQ+Uo=;
        b=MK8tC6nuiR08qZIRsRw3HZv6P3wJVUqQtImOCfgmLH1cfrL8U4iUubRDrvKtyxa/O9
         F+E0kZxeErysPXi7sd4rfSmfYIHc9mee9TpqRIvauHqvx8bvC6u/klZzcd6X/DCwn5xA
         Rp3jwlSXyeIbA/QEtzquh/oPrHuYxOE+r/WW/+SzBjwRlaMoJp60Zb+SKTGTsfoZ0qTK
         qhouLk4zBzzVcB3IN5n23X292/Jdm/JlwORzfGlMQCBHzyv2LNLhop+2Tp//1vmERRHb
         s971Oh7WjlYze8oEzRoM1PJVeIO0rPArcfmFGmkxK3fBl2MKsSmCWcfU7onmDyEUd6GP
         Gt6g==
Subject: [PATCH v2] toolsoftrade: Fix extraction range of waitall()
References: <CAJbg=FVgUTZqD2Xda17Lbk-6xc_GkRX8c_iqYx8W-vuBnfyutA@mail.gmail.com>
 <5ed234bd-dcc8-692f-544e-50413cffa73d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <063cfc13-f047-59d1-8679-be56f1735f80@gmail.com>
Date: Tue, 30 Apr 2019 09:12:16 +0900
MIME-Version: 1.0
In-Reply-To: <5ed234bd-dcc8-692f-544e-50413cffa73d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: Elad Lahav <e2lahav@gmail.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 23e640facc8198d97ec712e5b79aa3a69a270eb7 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 28 Apr 2019 00:41:02 +0900
Subject: [PATCH v2] toolsoftrade: Fix extraction range of waitall()

Commit 29d0c7c185f2 ("toolsoftrade: Add labels in code samples as
comments") failed to include the function name and the closing brace
in the snippet of waitall() extracted from api-pthreads.h.

The original snippet removed in commit a62cf8469280 ("toolsoftrade:
Reference line in code snippets by label") contained those
lines.

Fix it by moving meta commands in api-pthreads.h

Fixes: 29d0c7c185f2 ("toolsoftrade: Add labels in code samples as comments")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
v1 -> v2: As per Elad's POV, remove Reported-by tag.

 CodeSamples/api-pthreads/api-pthreads.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/CodeSamples/api-pthreads/api-pthreads.h b/CodeSamples/api-pthreads/api-pthreads.h
index f5510f01..5d17a9bd 100644
--- a/CodeSamples/api-pthreads/api-pthreads.h
+++ b/CodeSamples/api-pthreads/api-pthreads.h
@@ -287,9 +287,9 @@ static __inline__ void wait_all_threads(void)
 /*
  * Wait on all child processes.
  */
+// \begin{snippet}[labelbase=ln:api-pthreads:api-pthreads:waitall,commandchars=\%\[\]]
 static __inline__ void waitall(void)
 {
-// \begin{snippet}[labelbase=ln:api-pthreads:api-pthreads:waitall,commandchars=\%\[\]]
 	int pid;
 	int status;
 
@@ -303,8 +303,8 @@ static __inline__ void waitall(void)
 		}
 		poll(NULL, 0, 1);		//\fcvexclude
 	}					//\lnlbl{loopb}
-// \end{snippet}
 }
+// \end{snippet}
 
 static __inline__ void run_on(int cpu)
 {
-- 
2.17.1


