Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:37932 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728829AbfBLQio (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 12 Feb 2019 11:38:44 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x1CGXwS7127983
        for <perfbook@vger.kernel.org>; Tue, 12 Feb 2019 11:38:42 -0500
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2qm0rsuh9b-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Tue, 12 Feb 2019 11:38:42 -0500
Received: from localhost
        by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Tue, 12 Feb 2019 16:38:42 -0000
Date: Tue, 12 Feb 2019 08:38:40 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH 0/4] formal/spinhint: Clarify hashtable sizes used in
 tables
Reply-To: paulmck@linux.ibm.com
References: <1b7c8489-cf0a-d959-f307-e3eadae4998c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b7c8489-cf0a-d959-f307-e3eadae4998c@gmail.com>
Message-Id: <20190212163840.GN4240@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Feb 13, 2019 at 12:31:22AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> In your wordsmithing, there was confusion of hashtable sizes used in
> Tables 12.2 and 12.3. Patch #1 attempts to clarify the point. It also
> adds a footnote and fixes a few trivial typos.
> 
> Patch #2 is a minor tweak to use "lmtt" font for code snippets
> imported by \VerbatimInput{} command. This fixes font of Listing 12.3
> for experimental targets such as "msnt" and "1csf".
> 
> Patch #3 fixes font choice of snippets in experimental targets "msns"
> (original monospace font of "courier") and "mss" (previous monospace
> font choice of "scaled courier"), which have kept using those fonts for code
> snippets. As is mentioned in the change log, there are a lot of overfills
> in code snippets. On the other hand, the font used in the target "msn"
> (monospace narrow) is narrower than the "lmtt" font and it should be OK
> to use it in code snippets.
> 
> Patch #4 resolves the warning from "make" due to a stray litmus test
> "C-SB+o-rcusync-o+rl-rul-o.litmus". My guess is that this file was
> unintentionally sneaked into the repository in commit 4a6337b85633
> ("memorder: Cover litmus tests for accesses outside of RCU readers").
> But you may have an idea what the test of that name should look like.
> If this is the case, please update the test instead of applying this
> patch.

I applied #1 with tweaks and #2 and #3 as is.  I am holding off on #4
for the moment because it looks to me that it is being used.  So please
check my tweaks to #1 and my reasoning on #4.

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (4):
>   formal/spinhint: Clarify hashtable sizes used in Tables 12.2 and 12.3
>   Set default fontfamily for snippets of 'fancyvrb'
>   Change monospace font of snippets for targets 'mss', 'msns', and 'msn'
>   memorder: Remove 'snippet' meta command in stray litmus test
> 
>  CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-rul-o.litmus |  2 --
>  Makefile                                                 | 11 +++++------
>  formal/spinhint.tex                                      | 14 ++++++++------
>  perfbook.tex                                             |  5 +----
>  4 files changed, 14 insertions(+), 18 deletions(-)
> 
> -- 
> 2.7.4
> 

