Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:55288 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725965AbeJ0KhM (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sat, 27 Oct 2018 06:37:12 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w9R1ri9e096652
        for <perfbook@vger.kernel.org>; Fri, 26 Oct 2018 21:57:51 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2ncepfg6ph-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Fri, 26 Oct 2018 21:57:51 -0400
Received: from localhost
        by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Fri, 26 Oct 2018 21:57:51 -0400
Date: Fri, 26 Oct 2018 18:57:46 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: perfbook
Reply-To: paulmck@linux.ibm.com
References: <20181025083609.GA6766@andrea>
 <20181025100235.GR4170@linux.ibm.com>
 <20181026202014.GA4905@andrea>
 <8e6bc30b-d35f-e03e-9af4-14398bddf5b1@gmail.com>
 <20181026221402.GA5769@andrea>
 <6e0825ca-560d-4774-ce88-399c72053448@gmail.com>
 <20181026230623.GA11970@andrea>
 <f3f1a05c-c626-0f3a-8591-87fb93ea11ca@gmail.com>
 <2da98be8-9b4a-433d-fd6c-bf882c3ec5f6@gmail.com>
 <20181027004319.GA22818@andrea>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181027004319.GA22818@andrea>
Message-Id: <20181027015746.GB4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Andrea Parri <andrea.parri@amarulasolutions.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org

On Sat, Oct 27, 2018 at 02:43:19AM +0200, Andrea Parri wrote:
> On Sat, Oct 27, 2018 at 09:33:57AM +0900, Akira Yokosawa wrote:
> > On 2018/10/27 8:43, Akira Yokosawa wrote:
> > > On 2018/10/27 8:06, Andrea Parri wrote:
> > >>> And you have a2ping 2.83p, right?  Otherwise, Makefile should
> > >>> complain. Hmm???
> > >>
> > >> Indeed, 2.83p.
> > >>
> > >>
> > >>>
> > >>> Can you remove "> /dev/null 2>&1" on line 220 of Makefile,
> > >>> and let me know what a2ping should say?
> > >>
> > >> It says:
> > >>
> > >> /usr/local/bin/a2ping: not a GS output from gs (0)
> > > 
> > > Umm, "gs (0)" suggests exit code of gs is 0, which should indicate
> > > success. I have no idea what is going on.
> > 
> > Andrea,
> > 
> > Do you happen to set some of environment variables:
> > 
> >     GS_OPTIONS
> >     GS_DEVICE
> > 
> > and the like?
> 
> No GS_ variable set.

If you run a2ping manually, can you make it convert the file
CodeSamples/SMPdesign/smpalloc.canonical.eps to .pdf?

The Makefile uses "a2ping --below --hires --bboxfrom=compute-gs"
followed by the .eps and the .pdf names.

If that doesn't work, can you manually run "gs" to view the .eps file?

The thought is that there might be some argument needed (or vice versa)
on your system that isn't required on Akira's or my systems.

							Thanx, Paul

>   Andrea
> 
> 
> > 
> > Akira
> > 
> > > 
> > > I have a Ubuntu 18.04 virtual machine and a2ping 2.83p works happily
> > > there. 
> > > 
> > > Sorry but I can't help you at the moment.
> > > 
> > > Akira
> > > 
> > >>
> > >>   Andrea
> > >>
> > >>
> > >>>
> > >>> "GPL Ghostscript 9.25: Unrecoverable error, exit code 1" is not
> > >>> fatal and can be ignored as far as I know.
> > >>>
> > >>>       Akira
> > > 
> > 
> 

