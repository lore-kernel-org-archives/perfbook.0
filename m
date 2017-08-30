Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=B39QaYRwLkEaSjNZ/4z6CZrxVZRbyNR0oQ14FbuEHSs=;
 b=o6On5oGZ+NOEmzAIas6FWpwQtUvuI9g1MO2r4hTEbBOWMTlryMvOm/62otXzY1KZg9
 AREn6iUe0eXleaXgXDYOYdcgL/229VSZcQxbf6B+5py0Ffl8o+zRfxCFLcEEDVlR250M
 HnQhX97lE0wZ3tmNIEiyXcaxwRtjxCjRV22PXLp6U82tjYQOkV41A9f1ezY7eMcsH00u
 tHUuTN15TIiO41QtvSPbAg2hfXKZCv06pUz3MEJaeCnyn/hkz86hAEo8SR8NVoFx4iCo
 dqBqjIqj0qqcqwGdsLr3WYwBiXqLlpL34FvxQkmIuSTZkVeU9LXsz9uCdRZWMOtdCoL3
 /NYA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] memorder: Fix conjunction use
Message-ID: <d1a261b4-cd41-b61b-2847-b6bbd80ca4d7@gmail.com>
Date: Thu, 31 Aug 2017 00:12:46 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 453e325a5fbfc1de64cb51d200fe744bbb79016f Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 30 Aug 2017 23:55:37 +0900
Subject: [PATCH] memorder: Fix conjunction use

Fixes: 06ca30969d19 ("memorder: Acquire operations are not cumulative")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Paul,

This "unless" doesn't make sense as the following clause is
"there are at most two threads involved". There should be
other word choices. It's up to you which one to use.

    Thanks, Akira
--
 memorder/memorder.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 3b4763e..78f2cc4 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -518,7 +518,7 @@ failure.
 Column ``C'' indicates cumulativity and propagation, as explained in
 Sections~\ref{sec:memorder:Cumulativity}
 and~\ref{sec:memorder:Propagation}.
-In the meantime, this column can always be ignored unless there
+In the meantime, this column can always be ignored when there
 are at most two threads involved.

 \QuickQuiz{}
-- 
2.7.4

