Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=date:from:to:subject:message-id:mime-version:content-type
 :content-disposition:user-agent;
 bh=5sdxFWo7AljfLCWULmlRLxlC3qY/LLTbGYM2y1CKIAk=;
 b=knJI578H389bFVw0BrLhfqsTJmAVqC2kS4b4HHo60vg0hp0dUphtudnNfmCeOGw2QZ
 gfsgOQdHPVFhpJlYoVhrUsOnfV6MgbFhpZaiQFRTc2QJFY3S8JLoLX+VmorYIbHNlDwc
 VdkLPSPn15DV4rfEhERccUWq+9x2sBqLYEvgTS37Eg9ZplBTnEpVwaHJzKhWFfD+JspH
 iDP/eXoZTRtXXiWdyXw0qpl9stDk4RRWvrZ4TWXOz5qJCCYhw4TxH6CsPvqy5pps7e1e
 sWjv21Af6AqdoHBqLxAMOA1EvZRhfSfviQ0VerQAzxs/tavgl8EhX5LsoxR2koeM1tD3
 pAkQ==
Date: Thu, 19 Mar 2015 21:52:05 +0200
From: Andreea-Cristina Bernat <bernat.ada@gmail.com>
Subject: [PATCH] hazptr: Modify name of global variable that creates confusion
Message-ID: <20150319195205.GA30570@ada>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: paulmckrcu@gmail.com, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Since the former global variable plist was assigned to the local
variable plist from the hazptr_init() function, the following warning
was generated:
	'plist' defined but not used.
Therefore, this patch renames the global variable plist to gplist.

Signed-off-by: Andreea-Cristina Bernat <bernat.ada@gmail.com>
---
 CodeSamples/defer/hazptr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/CodeSamples/defer/hazptr.c b/CodeSamples/defer/hazptr.c
index e8c8cbc..2e8f819 100644
--- a/CodeSamples/defer/hazptr.c
+++ b/CodeSamples/defer/hazptr.c
@@ -23,7 +23,7 @@

 static hazptr_head_t __thread *rlist;
 static unsigned long __thread rcount;
-static hazptr_head_t __thread **plist;
+static hazptr_head_t __thread **gplist;

 void hazptr_init(void)
 {
@@ -94,7 +94,7 @@ void hazptr_scan()
 	hazptr_head_t *tmplist;

 	/* List of hazard pointers, and its size. */
-	hazptr_head_t **plist = plist;
+	hazptr_head_t **plist = gplist;
 	unsigned long psize;

 	if (plist == NULL) {
-- 
1.9.1

