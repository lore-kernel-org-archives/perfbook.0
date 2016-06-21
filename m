Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:61790 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)	by vger.kernel.org
 with ESMTP id S1751379AbcFUTBM (ORCPT	<rfc822;perfbook@vger.kernel.org>);
 Tue, 21 Jun 2016 15:01:12 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])	by
 mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u5LFxj9s139907
 for <perfbook@vger.kernel.org>; Tue, 21 Jun 2016 12:03:58 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])	by
 mx0b-001b2d01.pphosted.com with ESMTP id 23q6wc4tmm-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Tue,
 21 Jun 2016 12:03:58 -0400
Received: from localhost	by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Tue, 21 Jun
 2016 12:03:58 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29])	by d01dlp01.pok.ibm.com (Postfix) with ESMTP id C28AD38C8059
 for <perfbook@vger.kernel.org>; Tue, 21 Jun 2016 12:03:55 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u5LG3ujH3146008	for <perfbook@vger.kernel.org>; Tue, 21 Jun 2016 16:03:56 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u5LG3tq1019599	for <perfbook@vger.kernel.org>; Tue, 21 Jun 2016 12:03:55
 -0400
Date: Tue, 21 Jun 2016 09:03:58 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [GIT PULL] Cosmetic fixes for chapters 4, 5 and 6
Reply-To: paulmck@linux.vnet.ibm.com
References: <5d5dfa35-bee5-8370-4bab-9780d7ae0219@gmail.com>
 <20160620173209.GT3923@linux.vnet.ibm.com>
 <e07241f7-e686-bad7-dd20-98f8bfdb8d39@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e07241f7-e686-bad7-dd20-98f8bfdb8d39@gmail.com>
Message-Id: <20160621160358.GP3923@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Jun 22, 2016 at 12:31:26AM +0900, Akira Yokosawa wrote:
> On 2016/06/20 10:32:09 -0700, Paul E. McKenney wrote:
> >On Sat, Jun 18, 2016 at 05:43:23PM +0900, Akira Yokosawa wrote:
> >>The following changes since commit 17ba9e5472a7eefa5e7af13f708c1df4f772e11b:
> >>
> >>  cpu: Fix numbers in Performance of Mechanisms tables (2016-06-17 20:54:35 -0700)
> >>
> >>are available in the git repository at:
> >>
> >>  https://github.com/akiyks/perfbook.git cosmetic-fixes
> >>
> >>for you to fetch changes up to 0c2b722d652c4da3b3ba7c0521e50f0f2df57d59:
> >>
> >>  count: Typo fix ("a Intel" -> "an Intel") (2016-06-18 17:20:35 +0900)
> >>
> >>----------------------------------------------------------------
> >>Akira Yokosawa (9):
> >>      toolsoftrade: Centering figures of verbatim code examples
> >>      toolsoftrade: Adjust position of Figure 4.5
> >>      toolsoftrade: Use \path command for C source file name
> >>      count: Use \path command for C source file name
> >>      count: Centering figures of verbatim code examples
> >>      count: Tweak position of Figure 5.1
> >>      SMPdesign: Use \path command for path names
> >>      SMPdesign: Centering figures of verbatim code examples
> >>      count: Typo fix ("a Intel" -> "an Intel")
> >>
> >> SMPdesign/SMPdesign.tex       |  70 ++++++-----
> >> SMPdesign/beyond.tex          |  42 ++++---
> >> SMPdesign/partexercises.tex   |  32 +++--
> >> count/count.tex               | 270 ++++++++++++++++++++++++------------------
> >> perfbook.tex                  |   1 +
> >> toolsoftrade/toolsoftrade.tex |  98 ++++++++-------
> >> 6 files changed, 302 insertions(+), 211 deletions(-)
> >
> >Thank you, Akira!
> >
> >I queued this and pushed it, but I am a bit dissatisfied with the position
> >of Figure 5.1, stuck between the section heading and the text.  I agree
> >that its original position tucked underneath the long footnote 1 is also
> >not so good.
> >
> >I queued and pushed the patch below, which puts it above the section
> >heading, but please feel free to further improve it.
> 
> Well, as I said in the commit message, it was a compromise.
> I compared [hp] and [tp], and picked [hp], because it looks not so good
> to have the figure just above the section heading.
> I think the best position of the figure in this case is just above the
> footnote.
> 
> Today, I googled "latex floating figure underneath footnote", and found
> that by using 'footmisc' package, it is possible to place a floating figure/
> table just above a footnote.
> I'm going to test it and if it works as I expect, I'll send a pull request.

Sounds good, looking forward to seeing the results.

							Thanx, Paul

> >------------------------------------------------------------------------
> >
> >commit 15ddcdd3ae6bdc088f7c49f78edf62fff5090cfd
> >Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> >Date:   Mon Jun 20 10:30:49 2016 -0700
> >
> >    Further tweak position of "Just Count!" figure
> >
> >    Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> >
> >diff --git a/count/count.tex b/count/count.tex
> >index d0704536c91c..f4b63687892e 100644
> >--- a/count/count.tex
> >+++ b/count/count.tex
> >@@ -180,7 +180,7 @@ are more appropriate for advanced students.
> >  11 }
> > \end{verbbox}
> > }
> >-\begin{figure}[hp]
> >+\begin{figure}[tp]
> > \centering
> > \theverbbox
> > \caption{Just Count!}
> >
> >
> 

