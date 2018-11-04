Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:54194 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387393AbeKEIQB (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 5 Nov 2018 03:16:01 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wA4MxNmd066766
        for <perfbook@vger.kernel.org>; Sun, 4 Nov 2018 17:59:23 -0500
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2nj8ew2wg1-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Sun, 04 Nov 2018 17:59:23 -0500
Received: from localhost
        by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Sun, 4 Nov 2018 22:59:23 -0000
Date: Sun, 4 Nov 2018 12:30:42 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH 0/7] Further conversion of code snippets (howto, cpu,
 SMPdesign)
Reply-To: paulmck@linux.ibm.com
References: <fc130ee3-dbd0-b0d1-41a6-b49baa6b00e5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc130ee3-dbd0-b0d1-41a6-b49baa6b00e5@gmail.com>
Message-Id: <20181104203042.GM4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Nov 04, 2018 at 09:07:36AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> This is another set of patches converting code snippets to new scheme.
> Notes on the changes other than simple conversion follow.
> 
> Patch #2 contains somewhat ugly hack in lockhdeq.c to suppress
> "____cacheline_internodealigned_in_smp" in the resulting snippet.
> I'm afraid it could hurt your eyes.

;-)

> Patch #5 renames "percpu*" to "perthread*" to respect the names
> used in actual code.
> 
> Patch #6 includes substitution of ACCESS_ONCE -> READ_ONCE.
> 
> Patch #7 does the substitution under CodeSamples. It also adds
> a couple of function prototypes in maze.h.

The boxes for the inline code displays look good to me.  I have queued
these, and will push them once I get back on-grid.  Thank you!!!

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (7):
>   howto, cpu: Employ new scheme for command/code snippets
>   SMPdesign: Employ new scheme for snippet of lockhdeq.c
>   SMPdesign: Employ new scheme for snippet of lockhdeq.c and locktdeq.c
>   SMPdesign: Employ new scheme for inline snippets
>   SMPdesign: Employ new scheme for snippets from smpalloc.c
>   SMPdesign/beyond: Employ new scheme for inline pseudocode snippets
>   CodeSamples/SMPdesign/maze: Substitute {READ/WRITE}_ONCE() for
>     ACCESS_ONCE()
> 
>  CodeSamples/SMPdesign/lockhdeq.c       |  53 ++--
>  CodeSamples/SMPdesign/locktdeq.c       |  70 ++---
>  CodeSamples/SMPdesign/maze/maze.h      |   6 +
>  CodeSamples/SMPdesign/maze/maze_fg.c   |  18 +-
>  CodeSamples/SMPdesign/maze/maze_part.c |  18 +-
>  CodeSamples/SMPdesign/smpalloc.c       |  57 ++--
>  SMPdesign/SMPdesign.tex                | 479 ++++++++++++++-------------------
>  SMPdesign/beyond.tex                   | 319 +++++++++++-----------
>  SMPdesign/partexercises.tex            | 263 ++++++------------
>  cpu/overview.tex                       |  15 +-
>  howto/howto.tex                        |  60 ++---
>  11 files changed, 605 insertions(+), 753 deletions(-)
> 
> -- 
> 2.7.4
> 

