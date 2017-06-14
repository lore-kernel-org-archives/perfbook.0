Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=E+34BAYs7mZDm3bZUqQb1zaeY5tfFm1A6kISgxARa8w=;
 b=pveRY7QZCArlxvmeqQdqVcDkVmahN90wThaYGi8Kh2StnhIT5/IUKUiNaUwfRf1pf2
 KC3/NdMaAmh0fLGXMXZ4rsPtAqkum6SpwrMyVE6RM1W4ECteED4FEBClBGRz8W/PoYgf
 hUX05T2v4GS6UJYnB6GjyadMxLoCeEkYZvsy6mRVGnH3lz2XCw7gcEQo+98F74PBsnoL
 1ZtdPqPiD9Sdw8UKDnwFmGyJxIzSkLtA0tTYwkQv6j7lXtPR50+7dgiyBIbPQRnjMhrg
 nTZJXrYJkf0nH2/time6gEBnvb22S3yP9Ym3oc8d5ZZoH9Ofbfqpb5FDKX4XKlMqS+8l
 qA8Q==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH 2/5] route_rcu: Switch from ACCESS_ONCE() to
 READ_ONCE()/WRITE_ONCE()
Date: Wed, 14 Jun 2017 23:45:01 +0800
Message-Id: <1497455104-14102-3-git-send-email-junchangwang@gmail.com>
In-Reply-To: <1497455104-14102-1-git-send-email-junchangwang@gmail.com>
References: <1497455104-14102-1-git-send-email-junchangwang@gmail.com>
To: perfbook@vger.kernel.org, paulmck@linux.vnet.ibm.com
Cc: Junchang Wang <junchangwang@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Junchang Wang <junchangwang@gmail.com>
---
 CodeSamples/defer/route_rcu.c | 6 +++---
 defer/rcuusage.tex            | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/CodeSamples/defer/route_rcu.c b/CodeSamples/defer/route_rcu.c
index 9ac7b25..7716fe8 100644
--- a/CodeSamples/defer/route_rcu.c
+++ b/CodeSamples/defer/route_rcu.c
@@ -44,7 +44,7 @@ DEFINE_SPINLOCK(routelock);

 static void re_free(struct route_entry *rep)
 {
-	ACCESS_ONCE(rep->re_freed) = 1;
+	WRITE_ONCE(rep->re_freed, 1);
 	free(rep);
 }

@@ -60,7 +60,7 @@ unsigned long route_lookup(unsigned long addr)
 	cds_list_for_each_entry_rcu(rep, &route_list, re_next) {
 		if (rep->addr == addr) {
 			ret = rep->iface;
-			if (ACCESS_ONCE(rep->re_freed))
+			if (READ_ONCE(rep->re_freed))
 				abort();
 			rcu_read_unlock();
 			return ret;
@@ -93,7 +93,7 @@ static void route_cb(struct rcu_head *rhp)
 {
 	struct route_entry *rep = container_of(rhp, struct route_entry, rh);

-	ACCESS_ONCE(rep->re_freed) = 1;
+	WRITE_ONCE(rep->re_freed, 1);
 	re_free(rep);
 }

diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index 0a37312..9a90a14 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -64,7 +64,7 @@ Section~\ref{sec:defer:RCU Usage Summary} provides a summary.
 18                               re_next) {
 19     if (rep->addr == addr) {
 20       ret = rep->iface;
-21       if (ACCESS_ONCE(rep->re_freed))
+21       if (READ_ONCE(rep->re_freed))
 22         abort();
 23       rcu_read_unlock();
 24       return ret;
@@ -106,7 +106,7 @@ Section~\ref{sec:defer:RCU Usage Summary} provides a summary.
 20   struct route_entry *rep;
 21
 22   rep = container_of(rhp, struct route_entry, rh);
-23   ACCESS_ONCE(rep->re_freed) = 1;
+23   WRITE_ONCE(rep->re_freed, 1);
 24   free(rep);
 25 }
 26
-- 
2.7.4

