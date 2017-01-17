Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:58402 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1750863AbdAQW1Q (ORCPT <rfc822;perfbook@vger.kernel.org>); Tue, 17
 Jan 2017 17:27:16 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v0HMJ1Pa008781
 for <perfbook@vger.kernel.org>; Tue, 17 Jan 2017 17:27:16 -0500
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 281sdxp0g1-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Tue,
 17 Jan 2017 17:27:16 -0500
Received: from localhost by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Tue, 17 Jan
 2017 15:27:15 -0700
Date: Tue, 17 Jan 2017 14:27:09 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/2] bib: Replace UTF-8 chars with plain ASCII chars
Reply-To: paulmck@linux.vnet.ibm.com
References: <2fba7d76-719e-8947-cbc0-ee25040f84f1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fba7d76-719e-8947-cbc0-ee25040f84f1@gmail.com>
Message-Id: <20170117222709.GG5238@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Jan 18, 2017 at 12:21:41AM +0900, Akira Yokosawa wrote:
> >From 9818f62d94a501d24bb073a6a2127cfe6f2afc10 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Wed, 18 Jan 2017 00:08:46 +0900
> Subject: [PATCH 0/2] bib: Replace UTF-8 chars with plain ASCII chars
> 
> Hi Paul,
> 
> I noticed some .bib files which contain UTF-8 encoded characters.
> Again, these are patches for bibliography, so they will involve your
> manual intervention to apply. Also, as the patches themselves contain
> UTF-8 chars, I'm not sure you can apply them as usual.
> FWIW, this set is sent in UTF-8 encoding.
> 
> Anyway, could you please try them?

They worked fine, and good catches!  You would almost think that I
was guilty of copying and pasting titles...

Queued and pushed.

							Thanx, Paul

>                                          Thanks, Akira
> --
> Akira Yokosawa (2):
>   bib/hw: Replace UTF-8 encoded single quote with plain ascii
>   bib: Replace UTF-8 chars with plain ascii latex sequences
> 
>  bib/RCU.bib      | 2 +-
>  bib/TM.bib       | 2 +-
>  bib/hw.bib       | 4 ++--
>  bib/realtime.bib | 2 +-
>  bib/swtools.bib  | 2 +-
>  5 files changed, 6 insertions(+), 6 deletions(-)
> 
> -- 
> 2.7.4
> 

