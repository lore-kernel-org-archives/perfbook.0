Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:58400 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728128AbeKAB1b (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 31 Oct 2018 21:27:31 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w9VGNcCj102769
        for <perfbook@vger.kernel.org>; Wed, 31 Oct 2018 12:28:47 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2nfdvypnrr-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Wed, 31 Oct 2018 12:28:43 -0400
Received: from localhost
        by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Wed, 31 Oct 2018 16:28:41 -0000
Date: Wed, 31 Oct 2018 09:28:38 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH 0/8] Improve conversion of litmus test snippet
Reply-To: paulmck@linux.ibm.com
References: <a0be104e-0043-36bb-a639-4ecd6db77d59@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0be104e-0043-36bb-a639-4ecd6db77d59@gmail.com>
Message-Id: <20181031162838.GB4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Nov 01, 2018 at 12:08:02AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> In snippets of litmus tests you added recently uses "locations"
> directive. It was not covered by reorder_ltms.pl.
> This series enhances reorder_ltms.pl to add an option to
> the meta command "\end[snippet]".
> 
> Now you can put C-RCU-remove.litmus and
> C-RomanPenyanev-list-rcu-rr.litmus under CodeSamples/.
> 
> Patch #1 is the enhancement of reorder_ltms.pl.
> Patch #2 adds C-RCU-remove.litmus in CodeSamples/formal/herd.
> Note that I modified the choice of characters given to
> the "commandchars=" option to avoid collision with characters
> used in snippets.
> Patch #3 adds recipe in Makefile to run the added tests by
> "make run-herd7".
> Patch #4 replaces the inline snippet code with converted one.
> Patch #5 adds another RCU litmus test in CodeSamples/formal/herd.
> Patch #6 imports snippet converted from above.
> Patch #7 converts existing PPC IRIW litmus tests to new scheme
> It also reduces the width of the snippets to fit in 2c column
> width.
> Patch #8 is a trivial typo fix.
> 
> I'm afraid commit logs in this series is not descriptive
> enough, but hopefully the intention of the changes are evident.

They should do.  I queued these and pushed them, thank you!

						Thanx, Paul

>         Thanks, Akira
> -- 
> Akira Yokosawa (8):
>   reorder_ltms.pl: Add 'locationslabel=' option to \end[snippet]
>   CodeSamples/formal: Add C-RCU-remove.litmus
>   CodeSamples/formal/herd: Add recipe for native .litmus tests
>   formal/axiomatic: Import snippet from C-RCU-remove.litmus
>   CodeSamples/formal: Add C-RomanPenyanev-list-rcu-rr.litmus
>   formal/axiomatic: Import snippet from
>     C-RomanPenyanev-list-rcu-rr.litmus
>   formal/axiomatic: Convert snippets of IRIW tests to new scheme
>   formal/axiomatic: Fill in missing ')'
> 
>  CodeSamples/formal/herd/C-RCU-remove.litmus        |  27 +++
>  .../formal/herd/C-RomanPenyaev-list-rcu-rr.litmus  |  47 +++++
>  CodeSamples/formal/herd/Makefile                   |  21 ++-
>  formal/axiomatic.tex                               | 201 +++++++--------------
>  utilities/reorder_ltms.pl                          |  15 ++
>  5 files changed, 164 insertions(+), 147 deletions(-)
>  create mode 100644 CodeSamples/formal/herd/C-RCU-remove.litmus
>  create mode 100644 CodeSamples/formal/herd/C-RomanPenyaev-list-rcu-rr.litmus
> 
> -- 
> 2.7.4
> 

