Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e37.co.us.ibm.com ([32.97.110.158]:47317 "EHLO
 e37.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1751441AbcESAdx (ORCPT	<rfc822;perfbook@vger.kernel.org>); Wed, 18 May 2016
 20:33:53 -0400
Received: from localhost	by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Wed, 18 May
 2016 18:33:49 -0600
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29])	by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id
 EF34D19D803F	for <perfbook@vger.kernel.org>; Wed, 18 May 2016 18:33:28 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4J0XkUk39583746	for <perfbook@vger.kernel.org>; Thu, 19 May 2016 00:33:46
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4J0XjPd031845	for <perfbook@vger.kernel.org>; Wed, 18 May 2016 20:33:46
 -0400
Date: Wed, 18 May 2016 17:33:50 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/2] locking: fixup trivial nitpicks
Message-ID: <20160519003350.GG3528@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <1463612040-21728-1-git-send-email-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1463612040-21728-1-git-send-email-sj38.park@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, May 19, 2016 at 07:53:58AM +0900, SeongJae Park wrote:
> This patchset contains fixup of trivial nitpickes that found during translation
> of locking/ directory.

Queued and pushed, thank you!

On future submissions, could you please capitalize the word in the
subject line following the ":", as shown below?  (I have been fixing
them manually.)

							Thanx, Paul

> SeongJae Park (2):
>   locking: use consistent expressions
    locking: Use consistent expressions
>   locking: fix typos
    locking: Fix typos
> 
>  locking/locking.tex | 38 +++++++++++++++++++-------------------
>  1 file changed, 19 insertions(+), 19 deletions(-)
> 
> -- 
> 1.9.1
> 

