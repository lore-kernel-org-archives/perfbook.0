Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:35376 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728784AbeJ1Buw (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sat, 27 Oct 2018 21:50:52 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w9RH8xZI169311
        for <perfbook@vger.kernel.org>; Sat, 27 Oct 2018 13:09:14 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2nchna0yc7-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Sat, 27 Oct 2018 13:09:13 -0400
Received: from localhost
        by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Sat, 27 Oct 2018 13:09:13 -0400
Date: Sat, 27 Oct 2018 10:09:09 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: perfbook
Reply-To: paulmck@linux.ibm.com
References: <20181025083609.GA6766@andrea>
 <20181025100235.GR4170@linux.ibm.com>
 <20181026202014.GA4905@andrea>
 <8e6bc30b-d35f-e03e-9af4-14398bddf5b1@gmail.com>
 <20181026221402.GA5769@andrea>
 <96dcab56-15ff-0af2-0322-1b95b561c16b@gmail.com>
 <20181027125844.GA6083@andrea>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181027125844.GA6083@andrea>
Message-Id: <20181027170908.GC4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Andrea Parri <andrea.parri@amarulasolutions.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org

On Sat, Oct 27, 2018 at 02:58:44PM +0200, Andrea Parri wrote:
> > Just want to make sure the gs version.
> > 
> > "gs -v" on my Ubuntu 18.04 says:
> > 
> > GPL Ghostscript 9.25 (2018-09-13)
> > Copyright (C) 2018 Artifex Software, Inc.  All rights reserved.
> > 
> > What does your "gs -v" say?
> 
> It said:
> 
> GPL Ghostscript GIT PRERELEASE 9.25 (2018-03-21)
> Copyright (C) 2018 Artifex Software, Inc.  All rights reserved.
> 
> which suggested that my previous "from ubuntu 18.04" was in fact not
> matching reality: it looks like I installed gs from sources, only a
> few months ago, and completely forgot about it. ;/  Mah, I manually
> removed my binary (/usr/local/bin/gs), and apt-purged-and-installed
> fig2ps ghostscript ghostscript-x gv.

Been there, done that.  ;-)

> Now it says:
> 
> GPL Ghostscript 9.25 (2018-09-13)
> Copyright (C) 2018 Artifex Software, Inc.  All rights reserved.
> 
> which seems to match what you reported above.  I was then able to
> generate perfbook.pdf, even though with a bunch of:

Very good!  ;-)

> CodeSamples/SMPdesign/smpalloc.canonical.eps --> CodeSamples/SMPdesign/smpalloc.canonical.pdf
> GPL Ghostscript 9.25: Unrecoverable error, exit code 1
> 
> I only had a quick look at the generated .pdf, but I haven't noticed
> issues.  Are those errors expected?  Any other suggestion?

What Akira said on this one (and thank you, Akira!).  You just need to get
rid of the diagnostic change that Akira suggested earlier in this thread.

							Thanx, Paul

