Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:39527 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1752087AbdBHQjZ (ORCPT <rfc822;perfbook@vger.kernel.org>); Wed, 8
 Feb 2017 11:39:25 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v18GTMI9094342
 for <perfbook@vger.kernel.org>; Wed, 8 Feb 2017 11:37:52 -0500
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 28g0c7t65g-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Wed,
 08 Feb 2017 11:37:51 -0500
Received: from localhost by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Wed, 8 Feb 2017
 09:37:50 -0700
Date: Wed, 8 Feb 2017 08:37:47 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/5] Bibliography update round 5
Reply-To: paulmck@linux.vnet.ibm.com
References: <3aa61663-43c2-6663-278a-2554ee4d5736@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3aa61663-43c2-6663-278a-2554ee4d5736@gmail.com>
Message-Id: <20170208163747.GO30506@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Feb 08, 2017 at 11:54:41PM +0900, Akira Yokosawa wrote:
> >From 58a0655ab2b5c555bd19a6d7624a9d4413cf1360 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Wed, 8 Feb 2017 23:34:47 +0900
> Subject: [PATCH 0/5] Bibliography update round 5
> 
> Hi Paul,
> 
> Here is round 5 of bibliography updates.
> Patches 1, 2, and 3 take care of broken urls. Patch 2 contains an
> alternative link to a webpage capture.
> Patch 4 is cosmetic fix of UCB in author fields
> Patch 5 is a different type of update. It adds awareness of "location"
> field in "inproceedings" entry. Please see the commit log for details.
> I think this is a reasonable change for perfbook.

I applied the first four, and might be convinced to apply the fifth.
But first a question -- how many changes would be required to bring
my old bib entries in line with current practice?  That might be the
best approach longer term.  Depending of course on how difficult it
is to locate them all...

							Thanx, Paul

>                                              Thanks, Akira
> --
> Akira Yokosawa (5):
>   bib/maze: Mark url of ETHZurich:FS2011maze as broken link
>   bib/syncrefs: Mark url of DougLocke2002a as broken
>   bib/syncrefs: Mark url of Victor2002a as broken
>   bib/parallelsys: Properly format UCB in author field
>   alphapf.bst: Make use of 'location' field in 'inproceedings' entry
> 
>  alphapf.bst         | 47 +++++++++++++++++++++++++++++++++--------------
>  bib/maze.bib        |  4 +++-
>  bib/parallelsys.bib |  4 ++--
>  bib/syncrefs.bib    | 14 ++++++++------
>  4 files changed, 46 insertions(+), 23 deletions(-)
> 
> -- 
> 2.7.4
> 

