Return-Path: <SRS0=JJuA=UO=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Cxh/+Ouh6P35kfs/6tCEJZw+xgIJVMj79HsydXG+dZY=;
        b=UondJNr/hGRFfq/mpYDpifLIQEQ16KOo1UtcudNoXET9p0NK5xqNOyoykIHKdzuEdL
         e5l3GtoI1N5cOxkiGwF4K4UvlTwVksAmbY60vzzHLZYgy7gtarbJVN/g7moqmvFNw8xr
         XTnnmZ2MWYk0zg7pOjmNMvNn8H6v3noFOpiiVHgH5L6qP2pTBATHf91L6yiq6rnETwZP
         wmOnF++ezMIOKFH78Ryb/axbSu6+9oEAbPGQqc1l/+mrszTRltVINq/uK6rY48tl09VC
         uhESvbf2AF6U+p1QIWLGRB2Z9wbZW31hQr0wI68URL2ldaxAK12gDEC+GB+McECT/pMK
         gUyQ==
Message-ID: <2c85d41b-77cb-b7cd-58ae-fec1d2793f35@gmail.com>
Date: Mon, 4 Apr 2022 09:21:25 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook v2 3/3] Fix period markers
Content-Language: en-US
References: <d68c77bc-b10e-3e4c-5d03-0f18c65e04f5@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <d68c77bc-b10e-3e4c-5d03-0f18c65e04f5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

These are caught by patterns added in punctcheck.pl.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 glossary.tex          | 2 +-
 memorder/memorder.tex | 2 +-
 together/applyrcu.tex | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/glossary.tex b/glossary.tex
index 46c68bbe..6038c9ed 100644
--- a/glossary.tex
+++ b/glossary.tex
@@ -143,7 +143,7 @@
 	takes a pointer, and old value, and a new value.
 	If the pointed-to value is equal to the old value, it is atomically
 	replaced with the new value.
-	There is some variety in CAS API.\@
+	There is some variety in CAS API\@.
 	One variation returns the actual pointed-to value, so that the
 	caller compares the CAS return value to the specified old value,
 	with equality indicating a successful CAS operation.
diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 9792099f..cb91de93 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -3303,7 +3303,7 @@ As it turns out, quite a bit:
 	same lock, and vice versa?
 \item	Suppose that a given CPU or thread executes one access
 	(call it ``A''), releases a lock, reacquires that same lock,
-	then executes another access (call it ``B'').\@
+	then executes another access (call it ``B'')\@.
 	Is some other CPU or thread not holding that lock guaranteed to
 	see A and B in order?
 \item	As above, but with the lock reacquisition carried out by some
diff --git a/together/applyrcu.tex b/together/applyrcu.tex
index 934fbed5..a3ee559e 100644
--- a/together/applyrcu.tex
+++ b/together/applyrcu.tex
@@ -816,7 +816,7 @@ For example, in Linux kernel v5.16, the \co{khugepaged_scan_file()}
 function checks to see if some other task needs the current CPU
 using \co{need_resched()}, and if so invokes \co{xas_pause()} to
 adjust the traveral's iterator appropriately, and then invokes
-\co{cond_resched_rcu()} to yield the CPU.\@
+\co{cond_resched_rcu()} to yield the CPU\@.
 In turn, the \co{cond_resched_rcu()} function invokes \co{rcu_read_unlock()},
 \co{cond_resched()}, and finally \co{rcu_read_lock()} to drop out of
 the RCU read-side critical section in order to yield the CPU.
-- 
2.25.1


