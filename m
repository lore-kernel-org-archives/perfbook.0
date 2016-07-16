Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=OfTCnn9zINAoB+vCxKFo0wPWIOunolRJTNtMX+S/UBA=;
 b=XtlPNDn+2M5wJXFCcq9Kxuw4XFnA9W8lULh7Jl0DKuuffrlaJXpeKyDxGf09pdhTPf
 3GdXKAglfhZRyUPNaPD/ELsDneqVoGYZBXs5KTbvxv0VXw+MgqZfasgdjzVkush0QKI2
 l6GeqKQOUtpf3M6R5czafsFCDlSLZECVQ94I84U5Uh9aoglgDWpZhkZDx705BrX1jI70
 SDOXXT6WjDAxeEufZ373FRcbQqZoPDWwDXx79SIMaD3kT1IUJ+I9sWHspfO8qZlzLIuX
 Xl4/EZmt3NZoXfBgU9V2e0hAUVROd5NBo6/gVmS+zarxcZ5vUL7A9Xs1zxnTZmX/yoWH
 dunw==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 4/4] defer/seqlock: Fix wrong code line reference
Date: Sat, 16 Jul 2016 16:58:50 +0900
Message-Id: <1468655930-9894-5-git-send-email-sj38.park@gmail.com>
In-Reply-To: <1468655930-9894-1-git-send-email-sj38.park@gmail.com>
References: <1468655930-9894-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 defer/seqlock.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/defer/seqlock.tex b/defer/seqlock.tex
index f379439..dbe2ebf 100644
--- a/defer/seqlock.tex
+++ b/defer/seqlock.tex
@@ -400,7 +400,7 @@ Figure~\ref{fig:defer:Sequence-Locked Pre-BSD Routing Table Lookup},
 line~5 adds \co{->re_freed}, which is checked on lines~29 and~30.
 Line~8 adds a sequence lock, which is used by \co{route_lookup()}
 on lines~18, 23, and~32, with lines~24 and~33 branching back to
-the \co{retry} label on line~16.
+the \co{retry} label on line~17.
 The effect is to retry any lookup that runs concurrently with an update.

 In
-- 
1.9.1

