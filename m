Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:44582 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726293AbfBGJSE (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 7 Feb 2019 04:18:04 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x1796ZDA065355
        for <perfbook@vger.kernel.org>; Thu, 7 Feb 2019 04:18:03 -0500
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2qgfqvnm5b-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Thu, 07 Feb 2019 04:18:02 -0500
Received: from localhost
        by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Thu, 7 Feb 2019 09:18:01 -0000
Date: Thu, 7 Feb 2019 01:17:57 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH 0/6] formal/spinhint: Update code snippet
Reply-To: paulmck@linux.ibm.com
References: <db974b96-dd4f-dce2-44a5-1b33f5ed495e@gmail.com>
 <20190202173437.GO4240@linux.ibm.com>
 <d48a0e7f-6869-86ac-6edf-a47c33cdaeb7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d48a0e7f-6869-86ac-6edf-a47c33cdaeb7@gmail.com>
Message-Id: <20190207091757.GE4240@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Feb 07, 2019 at 07:42:26AM +0900, Akira Yokosawa wrote:
> On 2019/02/02 09:34:37 -0800, Paul E. McKenney wrote:
> > On Sun, Feb 03, 2019 at 12:05:32AM +0900, Akira Yokosawa wrote:
> >> Hi Paul,
> >>
> >> Here is another round of code snippet update, with modernization
> >> of outputs of Spin and tables of state search results.
> >>
> >> Patch #1 updates fcvextract.pl so that .spin files are handled
> >> as the same as C source files.
> >>
> >> Patch #2 applies the new scheme to code snippets. It also contains
> >> minor changes for better typesetting.
> >>
> >> Patch #3 replaces captures of Spin outputs with those obtained
> >> from Spin version 6.4.8. This commit adds outputs as .lst files
> >> under CodeSamples/formal/promela/. They are added to the dependency
> >> in the top level Makefile.
> >>
> >> Patch #4 updates tables of Spin result.  For qrcu.spin, I used
> >> the compiler flag -DCOLLAPSE to complete the state search for
> >> updaters=3 readers=2 on a machine with 16GB memory. As far as
> >> I understand correctly, this compiler flag does not affect the
> >> completeness of state search. So I added some explanation in the text
> >> to mention the flag and the argument -mN of ./pan to increase the
> >> limit of search depth.
> >>
> >> Patch #5 tweaks footnote on a cell in a table.
> >>
> >> Patch #6 is a nitpick patch to consistently use \co{}.
> >>
> >> I'm wondering if Patch #4 is OK from your perspective.
> >> Any feedback is welcome!
> > 
> > Very good, applied and pushed!  I added a small patch on top of Patch #4
> > updating the extrapolation.  It was about a terabyte, and is now about
> > half that.
> 
> Half a terabyte is not prohibitively large these days, and Spin has
> another compaction option "-DMA=N" which aggressively reduces memory
> consumption in exchange of search speed.
> 
> It took three days to complete, with the total memory usage of 6.5GB.
> The output looks as follows:
> 
> --------
> (Spin Version 6.4.6 -- 2 December 2016)
>         + Partial Order Reduction
>         + Graph Encoding (-DMA=96)
> 
> Full statespace search for:
>         never claim             - (none specified)
>         assertion violations    +
>         cycle checks            - (disabled by -DSAFETY)
>         invalid end states      +
> 
> State-vector 96 byte, depth reached 2055621, errors: 0
> MA stats: -DMA=84 is sufficient
> Minimized Automaton:    56420520 nodes and 1.75128e+08 edges
> 9.6647071e+09 states, stored
> 9.7503813e+09 states, matched
> 1.9415088e+10 transitions (= stored+matched)
> 7.2047951e+09 atomic steps
> 
> Stats on memory usage (in Megabytes):
> 1142905.887     equivalent memory usage for states (stored*(State-vector + overhead))
>  5448.879       actual memory usage for states (compression: 0.48%)
>  1068.115       memory used for DFS stack (-m20000000)
>     1.619       memory lost to fragmentation
>  6515.375       total actual memory usage
> 
> 
> unreached in proctype qrcu_reader
>         (0 of 18 states)
> unreached in proctype qrcu_updater
>         qrcu.spin:102, state 82, "-end-"
>         (1 of 82 states)
> unreached in init
>         (0 of 23 states)
> 
> pan: elapsed time 2.72e+05 seconds
> pan: rate 35500.523 states/second
> --------
> 
> I'm not sure if this result is worthy enough to be mentioned
> in the text.

But of course!

As long as the entire table is generated with the same arguments and
configuration, and those arguments and configuration are called out
somewhere (perhaps in a script somewhere in CodeSamples), please do
send me a patch!

Perhaps even better would be to call out those configurations and
arguments earlier on in the section giving advice on how to use
Promela and spin.

							Thanx, Paul

> Thoughts?
> 
>         Thanks, Akira
> 
> >            I agree that -DCOLLAPSE is a pure optimization, so it should
> > be OK.  If we trust the documentation, anyway!  ;-)
> > 
> > 							Thanx, Paul
> > 
> >>         Thanks, Akira
> >> --
> >> Akira Yokosawa (6):
> >>   fcvextract.pl: Treat '.spin' files as C sources
> >>   formal/spinhint: Employ new scheme for code snippet
> >>   formal/spinhint: Update output lists of spin
> >>   formal/spinhint: Update tables of memory usage of Spin
> >>   formal/spinhint: Put footnote on header in table
> >>   formal/spinhint: Use \co{...} rather than {\tt ...}
> >>
> >>  CodeSamples/formal/promela/atomicincrement.spin    |   2 +
> >>  .../formal/promela/atomicincrement.spin.lst        |  28 +
> >>  CodeSamples/formal/promela/increment.spin          |  46 +-
> >>  CodeSamples/formal/promela/increment.spin.lst      |  28 +
> >>  .../formal/promela/increment.spin.trail.lst        |  42 +
> >>  CodeSamples/formal/promela/lock.h                  |  16 +-
> >>  CodeSamples/formal/promela/lock.spin               |  46 +-
> >>  CodeSamples/formal/promela/lock.spin.lst           |  29 +
> >>  CodeSamples/formal/promela/qrcu.spin               |  95 ++-
> >>  Makefile                                           |   4 +-
> >>  formal/spinhint.tex                                | 874 ++++++---------------
> >>  perfbook.tex                                       |   1 +
> >>  utilities/fcvextract.pl                            |   8 +-
> >>  13 files changed, 502 insertions(+), 717 deletions(-)
> >>  create mode 100644 CodeSamples/formal/promela/atomicincrement.spin.lst
> >>  create mode 100644 CodeSamples/formal/promela/increment.spin.lst
> >>  create mode 100644 CodeSamples/formal/promela/increment.spin.trail.lst
> >>  create mode 100644 CodeSamples/formal/promela/lock.spin.lst
> >>
> >> -- 
> >> 2.7.4
> >>
> > 
> 

