Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:57006 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1752375AbdECO7x (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Wed, 3 May 2017 10:59:53 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v43EwhM4038686
 for <perfbook@vger.kernel.org>; Wed, 3 May 2017 10:59:53 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2a790sg65d-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Wed,
 03 May 2017 10:59:52 -0400
Received: from localhost by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Wed, 3 May 2017
 10:59:52 -0400
Date: Wed, 3 May 2017 07:59:48 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [Q] Heisenbug and anti-heisenbug
Reply-To: paulmck@linux.vnet.ibm.com
References: <883b737a-0c32-dedc-daff-db556a6ec83a@gmail.com>
 <61b85306-48c8-d90d-b6a0-e56dbe1b75a3@gmail.com>
 <20170503024719.GK3956@linux.vnet.ibm.com>
 <b174742f-b2c5-d9f7-3fad-1c87efb2aeb7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b174742f-b2c5-d9f7-3fad-1c87efb2aeb7@gmail.com>
Message-Id: <20170503145948.GP3956@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, May 03, 2017 at 05:14:57PM +0900, Akira Yokosawa wrote:
> On 2017/05/02 19:47:19 -0700, Paul E. McKenney wrote:
> > On Wed, May 03, 2017 at 09:23:11AM +0900, Akira Yokosawa wrote:
> >> On 2017/05/03 09:09:37 +0900, Akira Yokosawa wrote:
> >>> Hi Paul,
> >>>
> >>> While reviewing your recent update in "Hunting Heisenbugs" section,
> >>> I found the analogy with particle physics didn't sit well with me.
> >>>
> >>> "Heisenbug" is defined as:
> >>>
> >>>> attempts to track down the heisenbug causes it to radically change
> >>>> its symptoms or even disappear completely. 
> >>>
> >>> "Anti-heisenbug" is introduced as:
> >>>
> >>>> Fortunately, particle physics is up to the task: Why not create
> >>>> an anti-heisenbug to annihilate the heisenbug?
> >>>
> >>> At this point, "anti-heisenbug" seems to mean a patch that fixes
> >>> the heisenbug.
> >>>
> >>> The use of anti-something in particle physics does not go along
> >>> with this usage.
> >>>
> >>> For example, antiproton is an antiparticle of proton.
> >>> antiproton has mostly the same property as proton,
> >>> with the exception of electric charge and magnetic moment.
> >>> Also, an antiproton and an antielectron (positron) can compose
> >>> an antihydrogen atom. Well, I'm sure you know all about this.
> >>>
> >>> So, if you employ this line of reasoning, an anti-heisenbug should
> >>> also be a bug with something opposite in nature.
> >>>
> >>> If a heisenbug is a bug which vanishes when it is being tracked down,
> >>> an anti-heisenbug would be a bug which only emerges when it (or 
> >>> something else) is being tracked down.
> >>>
> >>> However, it is not obvious you can create an anti-heisenbug for
> >>> a particular heisenbug so that when the two are combined, the symptoms
> >>> of both bugs to "annihilate".
> >>>
> >>> So I'm wondering "What was Paul's intention in using the word 'annihilate'?".
> >>>
> >>> In Section "Add Delay", anti-heisenbug is used as:
> >>>
> >>>> Once you spot a bug involving a race condition, it is frequently
> >>>> possible to create an anti-heisenbug by adding delay in this manner.
> >>>
> >>> This "anti-heisenbug" is not a bug, rather, it is a means to increase
> >>> the possibility of a given heisenbug to appear. 
> >>>
> >>
> >> Oops, I sent this prematurely.
> >> But you might be able to see my point here.
> >>
> >> This is not an important question, so please give it a look when you have
> >> done with whatever issue you are working on.
> > 
> > I freely admit that I am taking a fair amount of "poetic license" here.  ;-)
> 
> So, what about adding a footnote like this?

That isn't bad at all!

But let's take a look at several possible approaches:

o	Continue using "anti-heisenbug", but remove the current definition.
	(To the extent that it could be considered to be a definition.)

o	Use the following analogy:

		When you annihilate an electron and a positron, you don't
		get nothingness, you instead get an energetic photon.
		Similarly, when you annihilate a heisenbug and an
		anti-heisenbug, you don't (usually) get nothingness,
		instead, you get a (hopefully) easier-to-locate bug.

o	The solution you propose below.

o	Leave as is, and assume that people will get the "poetic license".

o	Additional ideas here!

o	Any of the above, but have a quick quiz on the definition
	instead of a footnote or an inline definition/explanation.

Thoughts?

							Thanx, Paul

>                         Thanks, Akira
> 
> --8<-->8--
> >From cdf227d76d6ec3b40f2dfd6f1a55aba7a1e1bb49 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Wed, 3 May 2017 16:40:15 +0900
> Subject: [PATCH] debugging: Add footnote on the use of 'anti-heisenbug'
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  debugging/debugging.tex | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/debugging/debugging.tex b/debugging/debugging.tex
> index e621ebd..146c696 100644
> --- a/debugging/debugging.tex
> +++ b/debugging/debugging.tex
> @@ -1386,7 +1386,11 @@ causes it to radically change its symptoms or even disappear completely.
>  If the field of physics inspired the name of this problem, it is only
>  logical that we should look to the field of physics for the solution.
>  Fortunately, particle physics is up to the task:
> -Why not create an anti-heisenbug to annihilate the heisenbug?
> +Why not create an anti-heisenbug\footnote{
> +	Here, we'll use ``anti-heisenbug'' to denote whatever means
> +	which would help us track down a given heisenbug, rather than
> +	its counterpart in a scrict sense of particle physics.}
> +to annihilate the heisenbug?
> 
>  This section describes a number of ways to do just that:
> 
> -- 
> 2.7.4
> 
> 

