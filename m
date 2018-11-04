Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=b+/f2BXINWseyjlLJ0iHGkPFaZlxytK1EtlqL9jp6hg=;
 b=J4rYqjDbexccjgZGvQVFMcszRXX/ugIrF9r2Wkh+Ep5Mrz5CB+K6zRyO0Mrf9OintG
 +fVbleR/ymJwvoicZH2UjqQbtYH6vQup4dmjfCU32GWGe/PaeV1bwCNOlhtOenwpBhbV
 zg8IpZp8HqeMD97OJEFvQxBjcPMrmk/1yh2DDkKz0aUL9d8wDyNoPa/deim0mwKIlizs
 1vcN0jVBzRI2FekELagR7e2qgGc4GlxAtauIj/GmXuuT/JyngQRx97Tm+xRySA2wJDwj
 8fklk4eRolNQKG3iiOE2AmlzEA9TCf5QZ4fOt6MR0/SrUOyexUvoCAPbYtnfO58LSnOr
 B9Mg==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH 1/2] memorder: fix typo
Date: Sun,  4 Nov 2018 19:18:38 +0800
Message-Id: <1541330319-14491-2-git-send-email-junchangwang@gmail.com>
In-Reply-To: <1541330319-14491-1-git-send-email-junchangwang@gmail.com>
References: <1541330319-14491-1-git-send-email-junchangwang@gmail.com>
To: paulmck@linux.vnet.ibm.com, akiyks@gmail.com
Cc: perfbook@vger.kernel.org, Junchang Wang <junchangwang@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Fix typos in memorder.tex.

Signed-off-by: Junchang Wang <junchangwang@gmail.com>
---
 memorder/memorder.tex | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 8e11e92..a478f60 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -1364,7 +1364,7 @@ The head pointer is \co{x1}, which initially
 references the \co{int} variable \co{y} (line~5), which is in turn
 initialized to the value $1$ (line~4).
 \co{P0()} updates head pointer \co{x1} to reference \co{x0} (line~12),
-but only afer initializing it to $2$ (line~10) and forcing ordering
+but only after initializing it to $2$ (line~10) and forcing ordering
 (line~11).
 \co{P1()} picks up the head pointer \co{x1} (line~21), and then loads
 the referenced value (line~22).
@@ -2294,9 +2294,9 @@ These ordering constraints are depicted graphically in
 Figure~\ref{fig:memorder:Cumulativity}.
 Note also that cumulativity is not limited to a single step back in time.
 If there was another load from \co{x} or store to \co{x} from any thread
-that came before the store on line~13, that prior load or store would also
-be ordered before the store on line~32, though only if both \co{r1} and
-\co{r2} both end up containing the address of \co{x}.
+that came before the store on line~8, that prior load or store would also
+be ordered before the store on line~16, though only if both \co{r1} and
+\co{r3} both end up containing the address of \co{x}.

 In short, use of cumulative ordering operations can suppress
 non-multicopy-atomic behaviors in some situations.
-- 
2.7.4

