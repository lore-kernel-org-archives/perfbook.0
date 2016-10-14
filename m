Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:39779 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1752447AbcJNOvO (ORCPT <rfc822;perfbook@vger.kernel.org>); Fri, 14
 Oct 2016 10:51:14 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id u9EEmTZM041374
 for <perfbook@vger.kernel.org>; Fri, 14 Oct 2016 10:51:13 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 262w62dvhf-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Fri,
 14 Oct 2016 10:51:13 -0400
Received: from localhost by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Fri, 14 Oct
 2016 08:51:12 -0600
Date: Fri, 14 Oct 2016 07:51:10 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/2] Makefile cleanups
Reply-To: paulmck@linux.vnet.ibm.com
References: <dee02541-574c-3686-8dc7-5cb02303a408@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dee02541-574c-3686-8dc7-5cb02303a408@gmail.com>
Message-Id: <20161014145110.GD29518@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Oct 14, 2016 at 07:05:35AM +0900, Akira Yokosawa wrote:
> >From 3fc3583818c9103ef2d1c01516b362c4b6768604 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Thu, 13 Oct 2016 20:51:46 +0900
> Subject: [PATCH 0/2] Makefile cleanups
> 
> Hi,
> 
> Here is a patch set sequel to commit 0e6e192e6ea7 ("Makefile: Use
> implicit rules for various layout options").
> 
> 1st patch shortens some rules by using automatic variables.
> 2nd one gets rid of apparent dependency rules like "1c: perfbook-1c.pdf"
> by using secondary-expansion feature of GNU make.
> 
> Now almost all redundant rules have been removed.
> There is no change in the behavior of make command.
> 
> This set is a by-product of my attempt to try some alternative monospace
> fonts to be used among Times Roman text.  To give you an easy way to
> compare candidates, I'm preparing patches to add a few make targets, but
> not sure where it goes.  This cleanup set seems worthwhile on its own.
> 
>                                             Thanks, Akira
> 
> Akira Yokosawa (2):
>   Makefile: Use more automatic variables
>   Makefile: Use seconday expansion
> 
>  .gitignore |  7 ++-----
>  Makefile   | 28 ++++++++++++++--------------
>  2 files changed, 16 insertions(+), 19 deletions(-)

Applied and pushed, thank you!

							Thanx, Paul

