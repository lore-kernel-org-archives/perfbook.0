Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:56400 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)	by vger.kernel.org with
 ESMTP id S1756168AbcFTSKA (ORCPT	<rfc822;perfbook@vger.kernel.org>); Mon, 20
 Jun 2016 14:10:00 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])	by
 mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u5KI9hBS003460
 for <perfbook@vger.kernel.org>; Mon, 20 Jun 2016 14:09:57 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])	by
 mx0a-001b2d01.pphosted.com with ESMTP id 23n2u6caqx-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Mon,
 20 Jun 2016 14:09:57 -0400
Received: from localhost	by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Mon, 20 Jun
 2016 12:09:56 -0600
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29])	by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id
 7E71A3E40047	for <perfbook@vger.kernel.org>; Mon, 20 Jun 2016 12:09:54 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u5KI9t2B55246878	for <perfbook@vger.kernel.org>; Mon, 20 Jun 2016 18:09:55
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u5KI9rG2030446	for <perfbook@vger.kernel.org>; Mon, 20 Jun 2016 14:09:53
 -0400
Date: Mon, 20 Jun 2016 10:32:09 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [GIT PULL] Cosmetic fixes for chapters 4, 5 and 6
Reply-To: paulmck@linux.vnet.ibm.com
References: <5d5dfa35-bee5-8370-4bab-9780d7ae0219@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d5dfa35-bee5-8370-4bab-9780d7ae0219@gmail.com>
Message-Id: <20160620173209.GT3923@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Jun 18, 2016 at 05:43:23PM +0900, Akira Yokosawa wrote:
> The following changes since commit 17ba9e5472a7eefa5e7af13f708c1df4f772e11b:
> 
>   cpu: Fix numbers in Performance of Mechanisms tables (2016-06-17 20:54:35 -0700)
> 
> are available in the git repository at:
> 
>   https://github.com/akiyks/perfbook.git cosmetic-fixes
> 
> for you to fetch changes up to 0c2b722d652c4da3b3ba7c0521e50f0f2df57d59:
> 
>   count: Typo fix ("a Intel" -> "an Intel") (2016-06-18 17:20:35 +0900)
> 
> ----------------------------------------------------------------
> Akira Yokosawa (9):
>       toolsoftrade: Centering figures of verbatim code examples
>       toolsoftrade: Adjust position of Figure 4.5
>       toolsoftrade: Use \path command for C source file name
>       count: Use \path command for C source file name
>       count: Centering figures of verbatim code examples
>       count: Tweak position of Figure 5.1
>       SMPdesign: Use \path command for path names
>       SMPdesign: Centering figures of verbatim code examples
>       count: Typo fix ("a Intel" -> "an Intel")
> 
>  SMPdesign/SMPdesign.tex       |  70 ++++++-----
>  SMPdesign/beyond.tex          |  42 ++++---
>  SMPdesign/partexercises.tex   |  32 +++--
>  count/count.tex               | 270 ++++++++++++++++++++++++------------------
>  perfbook.tex                  |   1 +
>  toolsoftrade/toolsoftrade.tex |  98 ++++++++-------
>  6 files changed, 302 insertions(+), 211 deletions(-)

Thank you, Akira!

I queued this and pushed it, but I am a bit dissatisfied with the position
of Figure 5.1, stuck between the section heading and the text.  I agree
that its original position tucked underneath the long footnote 1 is also
not so good.

I queued and pushed the patch below, which puts it above the section
heading, but please feel free to further improve it.

							Thanx, Paul

------------------------------------------------------------------------

commit 15ddcdd3ae6bdc088f7c49f78edf62fff5090cfd
Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Date:   Mon Jun 20 10:30:49 2016 -0700

    Further tweak position of "Just Count!" figure
    
    Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

diff --git a/count/count.tex b/count/count.tex
index d0704536c91c..f4b63687892e 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -180,7 +180,7 @@ are more appropriate for advanced students.
  11 }
 \end{verbbox}
 }
-\begin{figure}[hp]
+\begin{figure}[tp]
 \centering
 \theverbbox
 \caption{Just Count!}

