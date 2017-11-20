Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:51574 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751781AbdKTRnr (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 20
 Nov 2017 12:43:47 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id vAKHgD9A106385
 for <perfbook@vger.kernel.org>; Mon, 20 Nov 2017 12:43:46 -0500
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2ec2h4vexb-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 20 Nov 2017 12:43:46 -0500
Received: from localhost by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 20 Nov
 2017 12:43:44 -0500
Date: Mon, 20 Nov 2017 09:43:44 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Julia language
Reply-To: paulmck@linux.vnet.ibm.com
References: <31ffe8fa-8787-7554-ce37-285cb0961a26@gmail.com>
 <20171118191913.GJ3624@linux.vnet.ibm.com>
 <af00bd8f-245b-7a11-b110-91d6b95d152e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af00bd8f-245b-7a11-b110-91d6b95d152e@gmail.com>
Message-Id: <20171120174344.GT3624@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Nov 19, 2017 at 09:30:54AM +0900, Akira Yokosawa wrote:
> On 2017/11/19 4:19, Paul E. McKenney wrote:
> > On Fri, Nov 17, 2017 at 12:43:19AM +0900, Akira Yokosawa wrote:
> >> Hi Paul,
> >>
> >> Have you heard of "Julia" language?
> >>
> >> JFYI,
> >> As can be seen in its official page at https://julialang.org/ and a Wikipedia
> >> article at https://en.wikipedia.org/wiki/Julia_(programming_language),
> >> it looks like one of promising answers to perfbook's Section 2.2 "Parallel
> >> Programming Goals".
> >>
> >> As long as high-performance number crunching is concerned, it claims to have
> >> comparable performance to C, with a programming productivity much better
> >> than C + MPI.
> >>
> >> Note: I'm not a user of the language at the moment. I just heard of it at
> >> a twitter hashtag #julialang.
> >>
> >> I'd like you to check it up and (hopefully) update the above mentioned
> >> section in perfbook.
> > 
> > I had heard of it, but I had not heard of it being seriously proposed
> > as the answer to Section 2.2.  I have added it to todo.txt with your
> > Reported-by.
> > 
> > Have you or has someone you know used this for a large parallel-programming
> > project?  (Just looking for some real-world confirmation.)
> 
> So you want a secondary-source info on the real-world use?
> 
> I learned of Julia from Gen Kuroki's twitter activity since this June.
> He is a mathematician at Tohoku Univiersity, and experimenting/demonstrating
> Monte Carlo analysis of several statistic problems using Julia (on a Windows PC!).
> But what he is doing right now doesn't qualify as a _large_ parallel-programming
> project.
> 
> There is a case-studies page at https://juliacomputing.com/case-studies/,
> but this should be regarded as a primary source.
> 
> One of the case study, "Deep Learning for Medical Diagnosis" at
> https://juliacomputing.com/case-studies/ibm.html, looks like a collaboration
> of IBM and Juliacomputing.
> 
> Could this qualify as a real-world large parallel programming example?

Maybe...  Some evaluation and a proposal at the end...

But please understand that 40+ years working in this field has made me
deeply skeptical of sweeping claims for new languages.  Now, don't get
me wrong, Julia might well be great stuff that deserves mention in the
book, but let's first take a quick look at history.

Let's start with my employer, IBM.  This URL is informative:

http://www.softwarepreservation.org/projects/FORTRAN/BackusEtAl-Preliminary%20Report-1954.pdf

This is a 1954 report on the specifications for FORTRAN, reportedly
co-authored by none other than John Backus.  Please see page 3, first
full paragraph:

	Since FORTRAN should virtually eliminate coding and debugging,
	it should be possible to solve problems for less than half the
	cost that would be required without such a system.

To be fair, they were comparing coding in FORTRAN to coding in IBM 704
assembly language, but still, my use of FORTRAN in the 1970s involved
-significant- coding and debugging.  ;-)

Julia's case-studies page is impressive, but at first glance it appears
to mostly be centered on HPC, which leads me to question the "generality"
part of the iron triangle of parallel programming.  Gen Kuroki's use
case seems to be in a similar area.

So what to do?

For the upcoming release, nothing.  After all, it is only a few days away.

But perhaps later it might be good to expand Section 17.4 ("Functional
Programming for Parallelism") to cover languages instead of just
functional programming.  Julia might fit in here, as might Rust (given
the ownership aspects of its type system), Go (another popular parallel
system), and maybe even Python (because everyone and their dog seems
to use it).

Does that seem reasonable?

							Thanx, Paul

