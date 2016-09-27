Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VR3eMIClaSg1YLLRwcQdzt0g364JgfzUqCXy2Sjf+4M=;
 b=XHF5KO3hAETB0FcmW20rd6IFamZLyF+K09k1IsNO0FgbUn0tPO+0/HzxUHmDTqrl9a
 hmCYv9q/zllPJQNKhZqauun1uZkcmdsq1egn5mCow1/zFXdzPMG6r6fIcHUWT7RgWQLF
 V6XNdyYB0IBcvuOKCZvJ7P525rqxV8VrKKKS/NfQC9oZQmpsBqMPFf9wkQZXbtINirc7
 WQsHN56i7Nktw4E/IA2bf3NZpJfi5T2f9Xl3EvgJ0K2yuORydb1iXkbW1OIJN+tqSChg
 6ZnFJx3xtt7Khi0o7m9LzDEqkis/G0K9sCyxy0cXrmzoRajA9ui3AEtVC9ASys7zudee
 D0ow==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH v3 14/17] formal/ppcmem: Use P0 instead of thread 1
Date: Wed, 28 Sep 2016 06:56:38 +0900
Message-Id: <20160927215641.7330-14-sj38.park@gmail.com>
In-Reply-To: <20160927215641.7330-1-sj38.park@gmail.com>
References: <20160927215641.7330-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: akiyks@gmail.com, perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

There is a sentence that uses term `thread 1` to point `P0` in sample
PPCMEM litmus test.  Because all other sentences uses term `P0` for the
thread, it would be natural to use the term consistently.  This commit
fixes the sentence to use the consistent term.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/ppcmem.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/formal/ppcmem.tex b/formal/ppcmem.tex
index 5dfddd8..e33ba2f 100644
--- a/formal/ppcmem.tex
+++ b/formal/ppcmem.tex
@@ -185,7 +185,7 @@ and line~11 is equivalent to the C statement \co{r3=x}.
 	which in turn is tested by the \co{bne} instruction. Because actually
 	modeling the loop would result in state-space explosion, we
 	instead branch to the Fail: label, terminating the model with
-	the initial value of 2 in thread~1's \co{r3} register, which
+	the initial value of 2 in P0's \co{r3} register, which
 	will not trigger the exists assertion.

 	There is some debate about whether this trick is universally
-- 
2.10.0

