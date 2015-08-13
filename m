Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e34.co.us.ibm.com ([32.97.110.152]:55305 "EHLO
 e34.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1753514AbbHMQnE (ORCPT	<rfc822;perfbook@vger.kernel.org>); Thu, 13 Aug 2015
 12:43:04 -0400
Received: from /spool/local	by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Thu, 13 Aug
 2015 10:43:04 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])	by d03dlp01.boulder.ibm.com
 (Postfix) with ESMTP id 36C851FF005D	for <perfbook@vger.kernel.org>; Thu, 13
 Aug 2015 10:34:12 -0600 (MDT)
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com
 [9.17.195.170])	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0)
 with ESMTP id t7DGh2Av39518374	for <perfbook@vger.kernel.org>; Thu, 13 Aug
 2015 09:43:02 -0700
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])	by
 d03av04.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 t7DGh1BK003816	for <perfbook@vger.kernel.org>; Thu, 13 Aug 2015 10:43:02
 -0600
Date: Thu, 13 Aug 2015 09:43:01 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/2] CodeSample: rwdeq
Message-ID: <20150813164300.GB3895@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <1439366124-18185-1-git-send-email-dominik.dingel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1439366124-18185-1-git-send-email-dominik.dingel@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Dominik Dingel <dominik.dingel@gmail.com>
Cc: perfbook@vger.kernel.org, Dominik Dingel <dingel@linux.vnet.ibm.com>

On Wed, Aug 12, 2015 at 09:55:22AM +0200, Dominik Dingel wrote:
> From: Dominik Dingel <dingel@linux.vnet.ibm.com>
> 
> Hi all,
> 
> here is a somehow naive implementation of a reader/writer lock based approch
> for the parallel deq problem.
> 
> The next step would be to use it as an introduction example in the text, as due
> its way of implementation (taking always a read lock, working always with an
> atomic counter) it is a less efficient way of doing things, compared with the
> tandem approch. Then the benefits of partitioning might be even more obvious.
> 
> Thanks
> 	Dominik

Queued, thank you, Dominik!

A quick unscientific run leads me to believe that this is slightly faster
than the hashed implementation (not bad!), but about twice as slow as
the tandem version.  Of course, considerable variation is to be expected
based on workload.

							Thanx, Paul

> Dominik Dingel (2):
>   CodeSamples: Fix compiler warnings
>   CodeSamples: add read/write solution to the deq example
> 
>  CodeSamples/SMPdesign/Makefile       |   5 +-
>  CodeSamples/SMPdesign/deqtorture.h   |   2 +-
>  CodeSamples/SMPdesign/lockrwdeq.c    | 154 +++++++++++++++++++++++++++++++++++
>  CodeSamples/SMPdesign/locktdeq.c     |   4 -
>  CodeSamples/SMPdesign/matmul.c       |   3 +-
>  CodeSamples/SMPdesign/matmul_block.c |   3 +-
>  CodeSamples/SMPdesign/smpalloc.c     |   1 -
>  7 files changed, 163 insertions(+), 9 deletions(-)
>  create mode 100644 CodeSamples/SMPdesign/lockrwdeq.c
> 
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

