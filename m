Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:39862 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1726976AbeIAVme (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Sat, 1 Sep 2018 17:42:34 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w81HJGRa109198
 for <perfbook@vger.kernel.org>; Sat, 1 Sep 2018 13:29:51 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2m7ps459sx-1 (version=TLSv1.2
 cipher=AES256-GCM-SHA384 bits=256 verify=NOT) for <perfbook@vger.kernel.org>;
 Sat, 01 Sep 2018 13:29:51 -0400
Received: from localhost by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sat, 1 Sep 2018
 13:29:50 -0400
Date: Sat, 1 Sep 2018 10:29:47 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/3] Tweak section-level epigraph
Reply-To: paulmck@linux.vnet.ibm.com
References: <eb5de77b-fc3f-88d4-f717-c0f7314005e9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb5de77b-fc3f-88d4-f717-c0f7314005e9@gmail.com>
Message-Id: <20180901172947.GN4225@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Sep 01, 2018 at 09:11:36AM +0900, Akira Yokosawa wrote:
> >From 40c5e61208be1df272b99fa103b9d74ddbb1c379 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sat, 1 Sep 2018 08:45:12 +0900
> Subject: [PATCH 0/3] Tweak section-level epigraph
> 
> Hi Paul,
> 
> Recently, you added section-level epigraphs in debugging chapter.
> I noticed minor issues in there appearances.
> 
>   1. 1st paragraph of a section is now indented.
>   2. In "1csf" target, section-level epigraph of sans serif font
>      looks inconsistent with chapter-level epigraph of roman font.
> 
> Indent right after an epigraph can be suppressed by using
> "noindentafter" package. However, Ubuntu Trusty has a buggy one.
> So patch #1 imports the latest one.
> Patch #2 enables the \NoIndentAfterCmd setting for \epigraph{}.
> Patch #3 removes font family setting in \Epigraph{} for chapter-
> level epigraph.
> 
> Note that Patch #1 contains trailing blanks.

Nice!!!

But given the license and this line from noindentafter.sty, don't
we either have to also add noindentafter.tex on the one hand or
say where to get them on the other?

"This work consists of the files noindentafter.tex and noindentafter.sty."

Or am I misinterpreting the license?

							Thanx, Paul

>          Thanks, Akira
> 
> Akira Yokosawa (3):
>   Import noindentafter.sty 0.2.2
>   Suppress indent right after section-level epigraph
>   Remove font family specifier in \Epigraph{}
> 
>  Makefile          |   1 +
>  noindentafter.sty | 189 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  perfbook.tex      |   4 +-
>  3 files changed, 193 insertions(+), 1 deletion(-)
>  create mode 100644 noindentafter.sty
> 
> -- 
> 2.7.4
> 

