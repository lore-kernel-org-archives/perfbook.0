Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:36394 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S932849AbdKCN7w (ORCPT <rfc822;perfbook@vger.kernel.org>); Fri,
 3 Nov 2017 09:59:52 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id vA3DpCkS115065
 for <perfbook@vger.kernel.org>; Fri, 3 Nov 2017 09:59:52 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2e0rcsncg0-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Fri,
 03 Nov 2017 09:59:51 -0400
Received: from localhost by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Fri, 3 Nov 2017
 09:59:51 -0400
Date: Fri, 3 Nov 2017 06:59:48 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Incomplete sentence in commit 405f3f465f7f
Reply-To: paulmck@linux.vnet.ibm.com
References: <765342ad-03aa-180f-308f-010a6d503b5d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <765342ad-03aa-180f-308f-010a6d503b5d@gmail.com>
Message-Id: <20171103135948.GI3624@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Nov 02, 2017 at 10:32:30PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> In commit 405f3f465f7f ("debugging,formal: Update for increased Linux kernel usage"),
> there is an incomplete hunk of formal/formal.tex
> 
> @@ -135,6 +147,7 @@ The larger overarching software construct is of course validated by testing.
>         artifact from the viewpoint of formal verification, it is tiny
>         compared to a great number of projects, including LLVM,
>         \GCC, the Linux kernel, Hadoop, MongoDB, and a great many others.
> +       In addition, 
> 
>         Although formal verification is finally starting to show some
>         promise, including more-recent L4 verifications involving greater
> 
> What was your intention here?

Those two words do leave quite a bit to the imagination, don't they?

Good catch, thank you!  Does the patch below help?

							Thanx, Paul

-----------------------------------------------------------------------

commit 7f417104712459c70117333aa392d680350cae90
Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Date:   Fri Nov 3 06:58:10 2017 -0700

    formal: Complete verification-limitations thought in QQ12.33
    
    Reported-by: Akira Yokosawa <akiyks@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

diff --git a/formal/formal.tex b/formal/formal.tex
index 7c1aeac7d112..2fa410252197 100644
--- a/formal/formal.tex
+++ b/formal/formal.tex
@@ -147,7 +147,9 @@ The larger overarching software construct is of course validated by testing.
 	artifact from the viewpoint of formal verification, it is tiny
 	compared to a great number of projects, including LLVM,
 	\GCC, the Linux kernel, Hadoop, MongoDB, and a great many others.
-	In addition, 
+	In addition, this verification did have limits, as the researchers
+	freely admit, to their credit:
+	\url{https://wiki.sel4.systems/FrequentlyAskedQuestions#What_does_seL4.27s_formal_verification_mean.3F}.

 	Although formal verification is finally starting to show some
 	promise, including more-recent L4 verifications involving greater

