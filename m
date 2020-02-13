Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:55768 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727076AbgBMTTV (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Thu, 13 Feb 2020 14:19:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581621561;
        bh=zgwSzO9VxPyNh/XN0U1DeGfSxkQjsdLHKAfWSxn6XfA=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=tb2i4ujfVCMjXh+DcnXIJkooLuUNzlX6kJ6xHQ34YpOX94IjICPFwQJAudXtYSpcN
         R7cyUByK+hI2rvJQyzwXmOBdOrDXIPGh2cXDCAKa7pbfSIbEgQbD+A2Rg+vUOVjUst
         1Bdt37t2qzT8Oe4k3duKZwsxnhEP/W3jqn/VZubM=
Date: Thu, 13 Feb 2020 11:19:19 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] datastruct.tex: fix some minor typos
Message-ID: <20200213191919.GH2935@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20200212143457.GA25828@PhD>
 <47d5dcd4-64e5-57fa-4834-26d077712de6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47d5dcd4-64e5-57fa-4834-26d077712de6@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Junchang Wang <junchang2020@gmail.com>, perfbook@vger.kernel.org, junchangwang@gmail.com

On Fri, Feb 14, 2020 at 12:28:24AM +0900, Akira Yokosawa wrote:
> Hi, Junchang,
> 
> On Wed, 12 Feb 2020 22:35:15 +0800, Junchang Wang wrote:
> > Signed-off-by: Junchang Wang <junchangwang@gmail.com>
> > ---
> > 
> > Hi Paul,
> > 
> > I'm reading the latest version of the perfbook and this patch contains fixes to
> > some typos in Section Data Structures. Hope it helps.
> > 
> > Thanks,
> > --Junchang
> > 
> > --
> >  datastruct/datastruct.tex | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
> > index 4b62471..e21952b 100644
> > --- a/datastruct/datastruct.tex
> > +++ b/datastruct/datastruct.tex
> > @@ -700,7 +700,7 @@ Of course, it is quite possible that the differences in lookup performance
> >  are affected by the differences in update rates.
> >  One way to check this is to artificially throttle the update rates of
> >  per-bucket locking and hazard pointers to match that of RCU.
> > -Doing so does not significantly improve the lookup performace of
> > +Doing so does not significantly improve the lookup performance of
> >  per-bucket locking, nor does it close the gap between hazard pointers
> >  and RCU.
> >  However, removing the read-side memory barriers from hazard pointers
> > @@ -800,8 +800,8 @@ scalability, external consistency, or all of the above.
> >  \section{Non-Partitionable Data Structures}
> >  \label{sec:datastruct:Non-Partitionable Data Structures}
> >  %
> > -\epigraph{Undertake somthing difficult, otherwise you will never grow.}
> > -	 {\emph{Ronald E.~Osburn}}
> > +\epigraph{Undertake something difficult, otherwise you will never grow.}
> > +	 {\emph{Ronald E.~Osborn}}
> >  
> >  \begin{figure}[tb]
> >  \centering
> > @@ -1063,7 +1063,7 @@ Otherwise, a concurrent resize operation has already distributed this
> >  bucket, so line~\lnref{new_hashtbl} proceeds to the new hash table,
> >  line~\lnref{get_newbkt} selects the bucket corresponding to the key,
> >  and line~\lnref{acq_newbkt} acquires the bucket's lock.
> > -\Clnref{lsp1b}{lsp1e} store the bucket pointer and
> > +\Clnrefrange{lsp1b}{lsp1e} store the bucket pointer and
> 
> Thanks for catching this!

And from me as well!  Queued and pushed, thank you!

> As far as I see, there is no other error in the use of \clnrefrange/\crefrange
> at the moment.
> To prevent similar typos in the future, I'll add a check of this pattern somewhere
> in the build script.

Looking forward to it!

> PS:
> 
> The email address in the From: field does not match the SOB tag.
> Is this intentional?

I made the Signed-off-by: field match the From: field.  This can be
changed if need be.

							Thanx, Paul

> >  pointer-set index into their respective fields in the
> >  \co{ht_lock_state} structure, which again communicates this information to
> >  \co{hashtab_add()}, \co{hashtab_del()}, and \co{hashtab_unlock_mod()}.
> > 
