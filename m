Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:21391 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)	by vger.kernel.org
 with ESMTP id S932389AbcHJSDU (ORCPT	<rfc822;perfbook@vger.kernel.org>); Wed,
 10 Aug 2016 14:03:20 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])	by
 mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u7AAYPUe048753
 for <perfbook@vger.kernel.org>; Wed, 10 Aug 2016 06:39:03 -0400
Received: from e06smtp12.uk.ibm.com (e06smtp12.uk.ibm.com [195.75.94.108])	by
 mx0b-001b2d01.pphosted.com with ESMTP id 24qm9ty185-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Wed,
 10 Aug 2016 06:39:03 -0400
Received: from localhost	by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <rppt@linux.vnet.ibm.com>;	Wed, 10 Aug 2016
 11:39:02 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])	by
 d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id EAA6E17D8024	for
 <perfbook@vger.kernel.org>; Wed, 10 Aug 2016 11:40:38 +0100 (BST)
Received: from d06av04.portsmouth.uk.ibm.com (d06av04.portsmouth.uk.ibm.com
 [9.149.37.216])	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO
 v10.0) with ESMTP id u7AAcxtP27197584	for <perfbook@vger.kernel.org>; Wed, 10
 Aug 2016 10:38:59 GMT
Received: from d06av04.portsmouth.uk.ibm.com (localhost [127.0.0.1])	by
 d06av04.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u7AAcw8e017265	for <perfbook@vger.kernel.org>; Wed, 10 Aug 2016 04:38:58
 -0600
From: Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: [PATCH] toolsoftrade: minor grammar correction
Date: Wed, 10 Aug 2016 13:38:51 +0300
Message-Id: <1470825531-2051-1-git-send-email-rppt@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org
Cc: Mike Rapoport <rppt@linux.vnet.ibm.com>

Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
---
 toolsoftrade/toolsoftrade.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 9ed50fe..ad838d7 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -629,7 +629,7 @@ required by \co{pthread_create()}.
 	And for that reason, the \co{pthread_mutex_lock()} and
 	\co{pthread_mutex_unlock()} primitives are normally wrapped
 	in functions that do this error checking.
-	Later on, we will wrapper them with the Linux kernel
+	Later on, we will wrap them with the Linux kernel
 	\co{spin_lock()} and \co{spin_unlock()} APIs.
 } \QuickQuizEnd

-- 
1.9.1

