Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:34678 "EHLO
 out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)	by vger.kernel.org
 with ESMTP id S933241AbbDIUPj (ORCPT	<rfc822;perfbook@vger.kernel.org>); Thu,
 9 Apr 2015 16:15:39 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])	by
 mailout.nyi.internal (Postfix) with ESMTP id 2DE99207A9	for
 <perfbook@vger.kernel.org>; Thu, 9 Apr 2015 16:15:32 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=braap.org; h=date
 :from:message-id:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=
 yHJJtTd/Vwkkc73wu+tukP+Ubqw=; b=zBSct2zzSJbrmRQEU8R9VDgYBvN4x6GP
 vfYzcBDm/RDm6Ant3aZnr5brsz6h0stRYNkX216b2U8OdNrF7YG6x8JldDJ9IVjx
 ARiDjEyFNFXzkOjpVpI4PvtOHwUBudrxDDOTsOtNYnSUGJyLXnF9/RoIQ7/cTOmt	ylDE9Xw35G8=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=	messagingengine.com;
 h=date:from:message-id:subject:to	:x-sasl-enc:x-sasl-enc; s=smtpout;
 bh=yHJJtTd/Vwkkc73wu+tukP+Ubq	w=;
 b=jbyVE3E7UUzfIRu0uEvuXY1ewfPs0oLn9rdu93liGhjZNsA6XgnhsJJK6P
 KamVFryREugW2MLw3FYg1yeiySQc38zAZlHG6UBJMUWOBb8djR4XNNY6obEX3DLf
 sOXaqgxIfWySDLwlbu84hToPpE/SvWnFukkkK/oQMECtrtLYM=
Received: from localhost (unknown [128.59.20.216])	by mail.messagingengine.com
 (Postfix) with ESMTPA id F3FDF68013F	for <perfbook@vger.kernel.org>; Thu, 9
 Apr 2015 16:15:35 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
Subject: [PATCH] advsync: s/an write/a write/
Date: Thu,  9 Apr 2015 16:15:55 -0400
Message-Id: <1428610555-27168-1-git-send-email-cota@braap.org>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 advsync/memorybarriers.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index e8666db..2d16542 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -1777,7 +1777,7 @@ always be paired.  A lack of appropriate pairing is almost certainly an error.

 A write barrier should always be paired with a data dependency barrier or read
 barrier, though a general barrier would also be viable.  Similarly a read
-barrier or a data dependency barrier should always be paired with at least an
+barrier or a data dependency barrier should always be paired with at least a
 write barrier, though, again, a general barrier is viable:

 \vspace{5pt}
-- 
1.9.1

