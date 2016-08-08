Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:51387 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)	by vger.kernel.org with
 ESMTP id S1752167AbcHHQgm (ORCPT	<rfc822;perfbook@vger.kernel.org>); Mon, 8
 Aug 2016 12:36:42 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])	by
 mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u78GKCtD128058
 for <perfbook@vger.kernel.org>; Mon, 8 Aug 2016 12:36:41 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])	by
 mx0a-001b2d01.pphosted.com with ESMTP id 24n8sj5hce-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Mon,
 08 Aug 2016 12:36:41 -0400
Received: from localhost	by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Mon, 8 Aug 2016
 10:36:40 -0600
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28])	by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id
 48C6CC40010	for <perfbook@vger.kernel.org>; Mon, 8 Aug 2016 10:35:50 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u78Ga87D2359584	for <perfbook@vger.kernel.org>; Mon, 8 Aug 2016 16:36:08 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u78Ga6nP007812	for <perfbook@vger.kernel.org>; Mon, 8 Aug 2016 12:36:06 -0400
Date: Mon, 8 Aug 2016 09:36:08 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/5] Several cosmetic fixes
Reply-To: paulmck@linux.vnet.ibm.com
References: <32c543fd-cad8-f3da-4b1f-15ed2fd919c0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32c543fd-cad8-f3da-4b1f-15ed2fd919c0@gmail.com>
Message-Id: <20160808163608.GJ3482@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Aug 09, 2016 at 12:00:35AM +0900, Akira Yokosawa wrote:
> >From 572ae1f4ad166e144ceb0306100cb4f5a1235a4e Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Mon, 8 Aug 2016 23:06:10 +0900
> Subject: [PATCH 0/5] Several cosmetic fixes
> 
> Hi,
> 
> This patch series consists of mostly cosmetic fixes.
> 
> 1st one introduces 'extdash' package to enable hyphenation
> of fairly long cmnpound words such as "eventually-consistent".

I like this one a lot!  Much better than looking each word up in
the dictionary and ending up with something like this:

	e\-ven\-tu\-al\-ly-con\-sist\-ent

I had to do this a lot in a recent paper, quite annoying.  Also makes
string-searching painful.

The form enabled by your patch is a -lot- better, thank you!

	eventually\-/consistent

> 2nd one removes a line break between "lines" and "n-m".

Good!

> 3rd one adds \nbco{} command ("nbco" stands for non breakable co)
> to make sure short code snippet not to be broken.

This is very nice, good show!

> 4th one replaces "..." with \ldots for better looking ellipsis.

I was not all that excited about this one, but ended up taking it.
There aren't -that- many ellipses, and this patch really does make
them look better.

> 5th one is just a trial of marking up numbers to avoid using
> hyphens as minus signs. There are two types of mark up.
> One is \txnum{} which is to be used for values in running text.
> The other is \conum{} which is to be used for a value which appears
> in a nearby code snippet. This patch contains small number of example
> uses. I don't use math mode directly because you can modify the
> appearance of each mark-up by modifying just the definition in the
> preamble.
> 
> The effect of this series can be seen in the first paragraph of
> Section 6.1.2.3 "Hashed Double-Ended Queue" in the two column layout.
> Before the changes, the following line break looks ugly.
> 
> ... decreasing numbers (-1, -2, -
> 3, ...), while a series of ...
> 
> There are other ways to prevent the line break here, but I think using
> math mode or \nbco{} command is natural enough. 

But I did not take this one.  I am a bit concerned about everyone having
to type extra LaTeX commands for each and every number.

You could probably talk me into something for only the negative numbers.
Is it possible to make the "-" signs look nicer while still having the
positive and negative numbers not look different from each other?

							Thanx, Paul

>                                            Thanks, Akira
> 
> ----------------------------------------------
> Akira Yokosawa (5):
>   Trial use of extdash package with shortcuts option
>   formal/ppcmem: Avoid break-line after 'lines' in source
>   Add \nbco{} command for code snippet without line break
>   Use \ldots for ellipsis
>   Trial of marking up numbers in text
> 
>  SMPdesign/SMPdesign.tex              | 4 ++--
>  SMPdesign/partexercises.tex          | 4 ++--
>  advsync/memorybarriers.tex           | 2 +-
>  appendix/rcuhist/RCUinLinux.tex      | 2 +-
>  appendix/rcuimpl/rcupreempt.tex      | 6 +++---
>  appendix/whymb/whymemorybarriers.tex | 2 +-
>  count/count.tex                      | 4 ++--
>  datastruct/datastruct.tex            | 2 +-
>  formal/ppcmem.tex                    | 7 ++++---
>  future/htm.tex                       | 2 +-
>  howto/howto.tex                      | 2 +-
>  intro/intro.tex                      | 6 +++---
>  locking/locking.tex                  | 2 +-
>  perfbook.tex                         | 6 ++++++
>  rt/rt.tex                            | 2 +-
>  toolsoftrade/toolsoftrade.tex        | 4 ++--
>  16 files changed, 32 insertions(+), 25 deletions(-)
> 
> -- 
> 1.9.1
> 

