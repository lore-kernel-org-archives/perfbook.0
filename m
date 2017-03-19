Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:34765 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1752161AbdCSXX0 (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Sun, 19 Mar 2017 19:23:26 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v2JNIwfW035953
 for <perfbook@vger.kernel.org>; Sun, 19 Mar 2017 19:23:25 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 298y1s09rj-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sun,
 19 Mar 2017 19:23:25 -0400
Received: from localhost by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 19 Mar
 2017 19:23:24 -0400
Date: Sun, 19 Mar 2017 16:23:24 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/6] whymb: Convert to 'description' lists
Reply-To: paulmck@linux.vnet.ibm.com
References: <ad161e9f-b7f1-9e60-bed1-bad4a226e418@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad161e9f-b7f1-9e60-bed1-bad4a226e418@gmail.com>
Message-Id: <20170319232324.GE3637@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Mar 20, 2017 at 12:44:12AM +0900, Akira Yokosawa wrote:
> >From e29e397c3eab7359cdd866d5a59a0af56dfd22c4 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Mon, 20 Mar 2017 00:25:49 +0900
> Subject: [PATCH 0/6] whymb: Convert to 'description' lists
> 
> Hi Paul,
> 
> This series converts some of "itemize" and "enumerate" lists in whymb
> to "description" lists. In the fairly old commit 433c1ff9f545 ("pdflatex
> apparently doesn't like complex item parameters"), "description" lists
> were converted to "itemize" lists, but I don't see what went wrong.
> 
> Can you try this?

Looks fine to me, queued and pushed.  I guess we should expect some
improvement in the tools over the past five years.  ;-)

							Thanx, Paul

>                                        Thanks, Akira
> --
> Akira Yokosawa (6):
>   whymb: Convert to 'description' (part 1)
>   whymb: Convert to 'description' (part 2)
>   whymb: Convert to 'description' (part 3)
>   whymb: Use 'nextline' style for 'description'
>   whymb: Convert to 'description' (part 4)
>   whymb: Convert to 'description' (part 5)
> 
>  appendix/whymb/whymemorybarriers.tex | 113 ++++++++++++++++++-----------------
>  1 file changed, 57 insertions(+), 56 deletions(-)
> 
> -- 
> 2.7.4
> 

