Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53816 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751680AbdECCrZ (ORCPT <rfc822;perfbook@vger.kernel.org>); Tue, 2
 May 2017 22:47:25 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v432hoML146465
 for <perfbook@vger.kernel.org>; Tue, 2 May 2017 22:47:24 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2a765q90s8-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Tue,
 02 May 2017 22:47:24 -0400
Received: from localhost by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Tue, 2 May 2017
 22:47:23 -0400
Date: Tue, 2 May 2017 19:47:19 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [Q] Heisenbug and anti-heisenbug
Reply-To: paulmck@linux.vnet.ibm.com
References: <883b737a-0c32-dedc-daff-db556a6ec83a@gmail.com>
 <61b85306-48c8-d90d-b6a0-e56dbe1b75a3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61b85306-48c8-d90d-b6a0-e56dbe1b75a3@gmail.com>
Message-Id: <20170503024719.GK3956@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, May 03, 2017 at 09:23:11AM +0900, Akira Yokosawa wrote:
> On 2017/05/03 09:09:37 +0900, Akira Yokosawa wrote:
> > Hi Paul,
> > 
> > While reviewing your recent update in "Hunting Heisenbugs" section,
> > I found the analogy with particle physics didn't sit well with me.
> > 
> > "Heisenbug" is defined as:
> > 
> >> attempts to track down the heisenbug causes it to radically change
> >> its symptoms or even disappear completely. 
> > 
> > "Anti-heisenbug" is introduced as:
> > 
> >> Fortunately, particle physics is up to the task: Why not create
> >> an anti-heisenbug to annihilate the heisenbug?
> > 
> > At this point, "anti-heisenbug" seems to mean a patch that fixes
> > the heisenbug.
> > 
> > The use of anti-something in particle physics does not go along
> > with this usage.
> > 
> > For example, antiproton is an antiparticle of proton.
> > antiproton has mostly the same property as proton,
> > with the exception of electric charge and magnetic moment.
> > Also, an antiproton and an antielectron (positron) can compose
> > an antihydrogen atom. Well, I'm sure you know all about this.
> > 
> > So, if you employ this line of reasoning, an anti-heisenbug should
> > also be a bug with something opposite in nature.
> > 
> > If a heisenbug is a bug which vanishes when it is being tracked down,
> > an anti-heisenbug would be a bug which only emerges when it (or 
> > something else) is being tracked down.
> > 
> > However, it is not obvious you can create an anti-heisenbug for
> > a particular heisenbug so that when the two are combined, the symptoms
> > of both bugs to "annihilate".
> > 
> > So I'm wondering "What was Paul's intention in using the word 'annihilate'?".
> > 
> > In Section "Add Delay", anti-heisenbug is used as:
> > 
> >> Once you spot a bug involving a race condition, it is frequently
> >> possible to create an anti-heisenbug by adding delay in this manner.
> > 
> > This "anti-heisenbug" is not a bug, rather, it is a means to increase
> > the possibility of a given heisenbug to appear. 
> > 
> 
> Oops, I sent this prematurely.
> But you might be able to see my point here.
> 
> This is not an important question, so please give it a look when you have
> done with whatever issue you are working on.

I freely admit that I am taking a fair amount of "poetic license" here.  ;-)

							Thanx, Paul

