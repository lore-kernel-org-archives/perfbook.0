Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx1.redhat.com ([209.132.183.28]:47142 "EHLO mx1.redhat.com"
 rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP	id S1754098AbbIQJ2b
 (ORCPT <rfc822;perfbook@vger.kernel.org>);	Thu, 17 Sep 2015 05:28:31 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
 (int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])	by mx1.redhat.com
 (Postfix) with ESMTPS id 021CE1CA58D	for <perfbook@vger.kernel.org>; Thu, 17
 Sep 2015 09:28:30 +0000 (UTC)
Received: from donizetti.redhat.com (ovpn-112-79.ams2.redhat.com
 [10.36.112.79])	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4)
 with ESMTP id t8H9STG3015736	for <perfbook@vger.kernel.org>; Thu, 17 Sep 2015
 05:28:30 -0400
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] Typo in battery-powered systems Quick Quiz
Date: Thu, 17 Sep 2015 11:28:28 +0200
Message-Id: <1442482108-16627-1-git-send-email-pbonzini@redhat.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qqz.tex   | 4 ++--
 rt/rt.tex | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/qqz.tex b/qqz.tex
index cfd0356..2786754 100644
--- a/qqz.tex
+++ b/qqz.tex
@@ -6822,8 +6822,8 @@ srcu_read_unlock(&srcucb, idx);
 	But what about battery-powered systems?
 	They don't require energy flowing into the system as a whole.
 \QuickA{}
-	Sooner or later, either the battery much be recharged, which
-	requires energy to flow into the system, otherwise the system will
+	Sooner or later, either the battery must be recharged, which
+	requires energy to flow into the system, or the system will
 	stop operating.

 \QuickQ{}
diff --git a/rt/rt.tex b/rt/rt.tex
index daf943c..12a75ca 100644
--- a/rt/rt.tex
+++ b/rt/rt.tex
@@ -213,8 +213,8 @@ that portion of the outside world that is to be monitored or controlled.
 	But what about battery-powered systems?
 	They don't require energy flowing into the system as a whole.
 \QuickQuizAnswer{
-	Sooner or later, either the battery much be recharged, which
-	requires energy to flow into the system, otherwise the system will
+	Sooner or later, either the battery must be recharged, which
+	requires energy to flow into the system, or the system will
 	stop operating.
 } \QuickQuizEnd

-- 
2.5.0

