Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:55316 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726183AbfBBRlc (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sat, 2 Feb 2019 12:41:32 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x12HYACG136501
        for <perfbook@vger.kernel.org>; Sat, 2 Feb 2019 12:41:31 -0500
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2qda4tb7eu-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Sat, 02 Feb 2019 12:41:30 -0500
Received: from localhost
        by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Sat, 2 Feb 2019 17:41:30 -0000
Date: Sat, 2 Feb 2019 09:34:37 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH 0/6] formal/spinhint: Update code snippet
Reply-To: paulmck@linux.ibm.com
References: <db974b96-dd4f-dce2-44a5-1b33f5ed495e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db974b96-dd4f-dce2-44a5-1b33f5ed495e@gmail.com>
Message-Id: <20190202173437.GO4240@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Feb 03, 2019 at 12:05:32AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> Here is another round of code snippet update, with modernization
> of outputs of Spin and tables of state search results.
> 
> Patch #1 updates fcvextract.pl so that .spin files are handled
> as the same as C source files.
> 
> Patch #2 applies the new scheme to code snippets. It also contains
> minor changes for better typesetting.
> 
> Patch #3 replaces captures of Spin outputs with those obtained
> from Spin version 6.4.8. This commit adds outputs as .lst files
> under CodeSamples/formal/promela/. They are added to the dependency
> in the top level Makefile.
> 
> Patch #4 updates tables of Spin result.  For qrcu.spin, I used
> the compiler flag -DCOLLAPSE to complete the state search for
> updaters=3 readers=2 on a machine with 16GB memory. As far as
> I understand correctly, this compiler flag does not affect the
> completeness of state search. So I added some explanation in the text
> to mention the flag and the argument -mN of ./pan to increase the
> limit of search depth.
> 
> Patch #5 tweaks footnote on a cell in a table.
> 
> Patch #6 is a nitpick patch to consistently use \co{}.
> 
> I'm wondering if Patch #4 is OK from your perspective.
> Any feedback is welcome!

Very good, applied and pushed!  I added a small patch on top of Patch #4
updating the extrapolation.  It was about a terabyte, and is now about
half that.  I agree that -DCOLLAPSE is a pure optimization, so it should
be OK.  If we trust the documentation, anyway!  ;-)

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (6):
>   fcvextract.pl: Treat '.spin' files as C sources
>   formal/spinhint: Employ new scheme for code snippet
>   formal/spinhint: Update output lists of spin
>   formal/spinhint: Update tables of memory usage of Spin
>   formal/spinhint: Put footnote on header in table
>   formal/spinhint: Use \co{...} rather than {\tt ...}
> 
>  CodeSamples/formal/promela/atomicincrement.spin    |   2 +
>  .../formal/promela/atomicincrement.spin.lst        |  28 +
>  CodeSamples/formal/promela/increment.spin          |  46 +-
>  CodeSamples/formal/promela/increment.spin.lst      |  28 +
>  .../formal/promela/increment.spin.trail.lst        |  42 +
>  CodeSamples/formal/promela/lock.h                  |  16 +-
>  CodeSamples/formal/promela/lock.spin               |  46 +-
>  CodeSamples/formal/promela/lock.spin.lst           |  29 +
>  CodeSamples/formal/promela/qrcu.spin               |  95 ++-
>  Makefile                                           |   4 +-
>  formal/spinhint.tex                                | 874 ++++++---------------
>  perfbook.tex                                       |   1 +
>  utilities/fcvextract.pl                            |   8 +-
>  13 files changed, 502 insertions(+), 717 deletions(-)
>  create mode 100644 CodeSamples/formal/promela/atomicincrement.spin.lst
>  create mode 100644 CodeSamples/formal/promela/increment.spin.lst
>  create mode 100644 CodeSamples/formal/promela/increment.spin.trail.lst
>  create mode 100644 CodeSamples/formal/promela/lock.spin.lst
> 
> -- 
> 2.7.4
> 

