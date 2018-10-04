Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:54170 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727674AbeJDW0Q (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 4 Oct 2018 18:26:16 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w94FTOtK027206
        for <perfbook@vger.kernel.org>; Thu, 4 Oct 2018 11:32:28 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2mwkkh67nc-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Thu, 04 Oct 2018 11:32:27 -0400
Received: from localhost
        by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Thu, 4 Oct 2018 11:32:26 -0400
Date: Thu, 4 Oct 2018 08:32:23 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: Fwd: Other architectures we can work on?
Reply-To: paulmck@linux.ibm.com
References: <CABoNC81BJOPV3oBQ-Q9m9-5VZAdWq0L_r+4m6Wv7QWuXQo1LnA@mail.gmail.com>
 <CABoNC82ftdi_Ki-zhwv2xC1HVC4=O-wGvF+wS+MSCEa8ETctXQ@mail.gmail.com>
 <20181001175117.GF4222@linux.ibm.com>
 <CABoNC81Lsi6sC8MCh2T0KrKnt+c1QAVNOm7+601GuRqd8OVopg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABoNC81Lsi6sC8MCh2T0KrKnt+c1QAVNOm7+601GuRqd8OVopg@mail.gmail.com>
Message-Id: <20181004153223.GE2674@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Junchang Wang <junchangwang@gmail.com>
Cc: perfbook@vger.kernel.org

Hello, Junchang,

Glad it worked out for you!

Note that the DIY toolset (http://diy.inria.fr/) has things that
automatically exercise litmus tests on real hardware.  See the
CodeSamples/formal directory in the perfbook archive, and especially
its herd and litmus subdirectories, for some example uses.
(And kudos to Akira for setting this up!)

						Thanx, Paul

On Thu, Oct 04, 2018 at 11:01:00PM +0800, Junchang Wang wrote:
> Hi Paul,
> 
> Thanks a lot! OSU has approved my application and provisioned a PPC
> server for me. Now I can start testing code on PPC :-). For the ARM
> server, the application is still in progress. I'll let you know if
> there are any updates.
> 
> 
> Thank!
> --JunchangOn Tue, Oct 2, 2018 at 1:51 AM Paul E. McKenney
> <paulmck@linux.ibm.com> wrote:
> >
> > On Mon, Oct 01, 2018 at 11:23:17AM +0800, Junchang Wang wrote:
> > > Forward to list perfbook since the last mail was blocked due to the
> > > non-plain-text issue.
> > >
> > >
> > > Hi Paul and list,
> > >
> > > I'm again reading the excellent 15th chapter (Advanced
> > > Synchronization), which helps me eventually understand how a
> > > hardware/compiler can optimize--and hence ``break''-- my parallelized
> > > code :-).
> > >
> > > I really want to get my hands dirty and to test my code and samples in
> > > perfbook on real servers. However, all servers in my lab are x86. I
> > > wonder if there is any chance that we can have access to architectures
> > > other than x86 to test code. For example, are there any cloud service
> > > that provides access to POWER or ARM architecture?
> >
> > For POWER access for academic or open-source projects, please see here:
> >
> > https://osuosl.org/services/powerdev/request_hosting/
> >
> > There are said to be similar services for ARM, for example:
> >
> > https://thenewstack.io/cncf-packet-team-provide-free-infrastructure-cloud-developers
> >
> > Please let me know how it goes!
> >
> >                                                         Thanx, Paul
> >
> 

