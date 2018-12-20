Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60680 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728925AbeLTEfB (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 19 Dec 2018 23:35:01 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wBK4SO5X024489
        for <perfbook@vger.kernel.org>; Wed, 19 Dec 2018 23:35:00 -0500
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2pg3jqsehc-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Wed, 19 Dec 2018 23:35:00 -0500
Received: from localhost
        by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Thu, 20 Dec 2018 04:34:59 -0000
Date: Wed, 19 Dec 2018 20:35:00 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: Parallel programming book query
Reply-To: paulmck@linux.ibm.com
References: <CAGnMLyzE5pjntT4Hz1PZaLKbz-2LSP=ziK60yWyNbwr4=WBdAg@mail.gmail.com>
 <20181220004525.GZ4170@linux.ibm.com>
 <CAGnMLyyOaXro0g1q7ipnQVk1ei0dwiQGwqROBH+F=JoQmkoOzA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGnMLyyOaXro0g1q7ipnQVk1ei0dwiQGwqROBH+F=JoQmkoOzA@mail.gmail.com>
Message-Id: <20181220043500.GA4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Mark Morrissey <markem@pdx.edu>
Cc: alexey.roytman@oracle.com, perfbook@vger.kernel.org

No, that would work.  Not something I would think of because there is
no globally accessible ceil() function in the Linux kernel.  ;-)

I have queued a patch with your Reported-by as shown at the end of this
email.  Please let me know if I messed anything up.

							Thanx, Paul

On Wed, Dec 19, 2018 at 05:13:01PM -0800, Mark Morrissey wrote:
> I agree that it is equivalent to:
> 
> p = s * ceil(m/s)
> 
> But why not just perform that calculation? If it is based on either
> efficiency or clock cycles, I don't see it. I admit to not having looked at
> the implementation of the ceil() library routine. If I should look at
> ceil(), then just slap me and I will understand.
> 
> --mark
> --
> Mark Morrissey, markem@pdx.edu
> Senior Instructor, Computer Science
> Portland State University
> 
> 
> On Wed, Dec 19, 2018 at 4:45 PM Paul E. McKenney <paulmck@linux.ibm.com>
> wrote:
> 
> > On Mon, Dec 17, 2018 at 01:04:37PM -0800, Mark Morrissey wrote:
> > > Hi Paul,
> > >
> > > I am looking at your parallel programming book, 12/5/2018 version. In
> > > formula E.6, you use the floor function rather than the ceiling function.
> > > Is this deliberate or perhaps in error?
> >
> > Good question!
> >
> > The intent is that the "+ s - 1" in the numerator does the upwards part
> > of the rounding, and the floor function does the rest.
> >
> > Or am I missing something here?  It should be possible to express this
> > in terms of the ceiling function, though that would be further removed
> > from C code implementing this equation.
> >
> > Adding Alexey and the list on CC.  This is on page 423 (PDF page 435) of
> >
> > https://mirrors.edge.kernel.org/pub/linux/kernel/people/paulmck/perfbook/perfbook.2018.12.08a.pdf

------------------------------------------------------------------------

commit 9d317176364184ad6ef55fdab5535449fb8d110d
Author: Paul E. McKenney <paulmck@linux.ibm.com>
Date:   Wed Dec 19 20:30:28 2018 -0800

    SMPdesign: Use ceiling symbol, skip odd floor computation
    
    Equation E.6 in Quick Quiz 6.20 computes the floor function of
    "(m + 2 - 1) / s", which is just the ceiling function of "m / s".
    This commit therefore moves to this simpler formulation, on the
    strength of the ceil() function in the standard library.  The fact
    that ceil() is not globally available in the Linux kernel, which
    motivated the original, seems a bit irrelevant, hence the change.
    
    Reported-by: Mark Morrissey <markem@pdx.edu>
    Signed-off-by: Paul E. McKenney <paulmck@linux.ibm.com>

diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
index fe8f445851e3..0ba7ebd04fe6 100644
--- a/SMPdesign/SMPdesign.tex
+++ b/SMPdesign/SMPdesign.tex
@@ -1177,7 +1177,7 @@ this book.
 	$m$ rounded up to the next multiple of $s$, as follows:
 
 	\begin{equation}
-		p = s \left \lfloor \frac{m + s - 1}{s} \right \rfloor
+		p = s \left \lceil \frac{m}{s} \right \rceil
 	\label{sec:SMPdesign:p}
 	\end{equation}
 

