Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e36.co.us.ibm.com ([32.97.110.154]:54248 "EHLO
 e36.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1750775AbcCTPxJ (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sun, 20 Mar 2016
 11:53:09 -0400
Received: from localhost	by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sun, 20 Mar
 2016 09:53:08 -0600
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25])	by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id
 C1B041FF0021	for <perfbook@vger.kernel.org>; Sun, 20 Mar 2016 09:41:14 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u2KFr5Kt13893696	for <perfbook@vger.kernel.org>; Sun, 20 Mar 2016 15:53:05
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u2KFr57e017800	for <perfbook@vger.kernel.org>; Sun, 20 Mar 2016 11:53:05
 -0400
Date: Sun, 20 Mar 2016 08:53:10 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/3] polish `Why Memory Barriers?` appendix
Message-ID: <20160320155310.GK4287@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <1458433461-20936-1-git-send-email-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1458433461-20936-1-git-send-email-sj38.park@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Mar 20, 2016 at 09:24:18AM +0900, SeongJae Park wrote:
> This patchset polish `Why Memory Barriers?` appendix by fixing trivial nitpicks
> that found while translating it.  It fix trivial and evident typos, make terms
> to be used consistently, and finally proposes removal of a sentence that looks
> outdated.
> 
> SeongJae Park (3):
>   whymb: fix trivial typos
>   whymb: s/write buffer/store buffer
>   whymb: remove ARM's short multi processor history description

Good eyes, queued and pushed!

							Thanx, Paul

>  appendix/whymb/whymemorybarriers.tex | 92 ++++++++++++++++++------------------
>  1 file changed, 45 insertions(+), 47 deletions(-)
> 
> -- 
> 1.9.1
> 

