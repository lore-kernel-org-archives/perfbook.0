Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:60824 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)	by vger.kernel.org with
 ESMTP id S1753022AbcGKNxF (ORCPT	<rfc822;perfbook@vger.kernel.org>); Mon, 11
 Jul 2016 09:53:05 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])	by
 mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u6BDi4CJ129455
 for <perfbook@vger.kernel.org>; Mon, 11 Jul 2016 09:52:58 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])	by
 mx0a-001b2d01.pphosted.com with ESMTP id 242wt5wmtj-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Mon,
 11 Jul 2016 09:52:58 -0400
Received: from localhost	by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Mon, 11 Jul
 2016 07:52:57 -0600
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25])	by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id
 7B1AE19D801C	for <perfbook@vger.kernel.org>; Mon, 11 Jul 2016 07:52:05 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u6BDqSDf52691044	for <perfbook@vger.kernel.org>; Mon, 11 Jul 2016 13:52:28
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u6BDqSrO028421	for <perfbook@vger.kernel.org>; Mon, 11 Jul 2016 09:52:28
 -0400
Date: Mon, 11 Jul 2016 06:52:45 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [GIT PULL] Cosmetic fixes round 3 and other fixes
Reply-To: paulmck@linux.vnet.ibm.com
References: <8ed6c47e-5844-4ee0-d42e-0c038f27daec@gmail.com>
 <20160710144141.GW4650@linux.vnet.ibm.com>
 <7bc131c6-d5af-f8b7-dbf3-53de265ea5a7@gmail.com>
 <20160710153502.GY4650@linux.vnet.ibm.com>
 <bd5ad965-7472-494c-ff18-0bb6a1ed00af@gmail.com>
 <20160710232236.GB4650@linux.vnet.ibm.com>
 <135968d9-8c82-27df-da7b-4c7ec55a93d6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <135968d9-8c82-27df-da7b-4c7ec55a93d6@gmail.com>
Message-Id: <20160711135245.GG4650@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Jul 11, 2016 at 08:55:14PM +0900, Akira Yokosawa wrote:
> On 2016/07/10 16:22:36 -0700, Paul E. McKenney wrote:
> >On Mon, Jul 11, 2016 at 08:01:23AM +0900, Akira Yokosawa wrote:
> >>On 2016/07/10 08:35:02 -0700, Paul E. McKenney wrote:
> >>>On Mon, Jul 11, 2016 at 12:08:11AM +0900, Akira Yokosawa wrote:
> >>>>On 2016/07/10 23:41, Paul E. McKenney wrote:
> >>>>>On Sat, Jul 09, 2016 at 03:24:51PM +0900, Akira Yokosawa wrote:
> >>>>>>Hi Paul,
> >>>>>>
> >>>>>>Today, because of the weather, I have time to do clean up the cosmetic
> >>>>>>fixes. Appended are two pull requests.
> >>>>>
> >>>>>Very good!  I pulled both and pushed them out.  I made a small change
> >>>>>to the label for the table that you (rightly) changed to a figure,
> >>>>>so that it is prefixed by "tab:" rather than "fig:".
> >>>>>
> >>>>
> >>>>Oh, I missed those labels...
> >>>>
> >>>>So, I reviewed latex source of recently added figures.
> >>>>You are still using 'center' environment within 'figure' environment.
> >>>>That will cause extra small vertical spacing between the body of the
> >>>>figure and its caption.
> >>>>
> >>>>In stead of doing such as:
> >>>>
> >>>>\begin{figure}[tb]
> >>>>\begin{center}
> >>>>\resizebox{{2.5in}{!}{\includegraphics{path-to-figure}}
> >>>>\end{center}
> >>>>\caption{foo bar}
> >>>>\label{fig:foo bar}
> >>>>\end{figure}
> >>>>
> >>>>please do this way:
> >>>>
> >>>>\begin{figure}[tb]
> >>>>\centering
> >>>>\resizebox{{2.5in}{!}{\includegraphics{path-to-figure}}
> >>>>\caption{foo bar}
> >>>>\label{fig:foo bar}
> >>>>\end{figure}
> >>>
> >>>I fixed the one that I added to defer/refcnt.tex, good catch.
> >>>
> >>>>Also, there are templates in ".Templates/figure-graphics" that
> >>>>use the 'center' environment. They should also be fixed to use
> >>>>\centering instead.
> >>>
> >>>Actually, unless you have objections, I intend to remove them.  My
> >>>practice for a long time has been to copy existing figures.  In fact,
> >>>I had forgotten that the .Template directory even existed.  ;-)
> >>
> >>I found the template by using emacs' 'grep-find' function.
> >>So feel free to remove them.
> >>
> >>There remains one use of 'center' environment in
> >>/advsync/memorybarriers.tex.
> >>I left it as is since it is not nested in another environment.
> >>
> >>But it might be a good idea to promote it to a full-fledged figure with
> >>a caption. It's up to your preference.
> >
> >There are a number of minipage environments that might want to be
> >figures.  But there are so many of them in some places that latex's
> >figure-placement algorithm gets overwhelmed.
> >
> >>And there is another suggestion I'd like to make.
> >>
> >>Wouldn't it be a good idea to advertize the cross-link feature of qqz
> >>somewhere, for example in the Answer of Quick Quick 1.3?
> >
> >Like this?
> >
> >							Thanx, Paul
> >
> >------------------------------------------------------------------------
> >
> >commit 22f83a69d5dd496456b3975c5482b20af002927a
> >Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> >Date:   Sun Jul 10 16:20:22 2016 -0700
> >
> >    Add instructions on using quick-quiz hyperlinks
> >
> >    Reported-by: Akira Yokosawa <akiyks@gmail.com>
> >    Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> >
> >diff --git a/howto/howto.tex b/howto/howto.tex
> >index 7c6ef9de4739..177395fc85ca 100644
> >--- a/howto/howto.tex
> >+++ b/howto/howto.tex
> >@@ -206,6 +206,12 @@ Here are a few possible strategies:
> > 	expect to be called upon to generate parallel solutions given
> > 	only a blank sheet of paper.
> > \end{enumerate}
> >+
> >+Note that as of mid-2016 the quick quizzes are hyperlinked
> >+to the answer and vice versa, courtesy of Paolo Bonzini
> >+and Akira Yokosawa.
> >+Click either the ``Quick Quiz'' headings or the small squares
> >+to move back and forth between quiz and answer.
> > } \QuickQuizEnd
> >
> > In short, if you need a deep
> 
> Well, I'm a bit annoyed to see my name here...

Apologies, I did not anticipate that.

> What about the appended patch? (You have pushed the above changes, so
> this is relative to current master).
> And please do *not* apply this as is. I prefer a Reported-by: tag here.
> 
> If you do want to mention our names, somewhere in Appendix F would be
> a better place. I'm not insisting. It's up to your preference.

Or we could rely on the git log.  Anyone doing "git blame" on qqz.sty
will see that you contributed.  Would that work?

							Thanx, Paul

> ------------------------------------------------------------------------
> 
> commit bd7618fa0b56b891abb2266fd89a3b061a22d932
> Author: Akira Yokosawa <akiyks@gmail.com>
> Date:   Mon Jul 11 20:38:41 2016 +0900
> 
>     howto: Modify instructions on using quick-quiz hyperlinks
>     Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> 
> diff --git a/howto/howto.tex b/howto/howto.tex
> index 177395f..3daf5ce 100644
> --- a/howto/howto.tex
> +++ b/howto/howto.tex
> @@ -208,10 +208,10 @@ Here are a few possible strategies:
>  \end{enumerate}
>  Note that as of mid-2016 the quick quizzes are hyperlinked
> -to the answer and vice versa, courtesy of Paolo Bonzini
> -and Akira Yokosawa.
> -Click either the ``Quick Quiz'' headings or the small squares
> -to move back and forth between quiz and answer.
> +to the answer and vice versa.
> +While reading in a PDF reader, click either the ``Quick Quiz''
> +headings or the small squares at the end to move back and forth
> +between quiz and answer.
>  } \QuickQuizEnd
>  In short, if you need a deep
> 

