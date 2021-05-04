Return-Path: <SRS0=1xOK=J7=gmail.com=zhouzhouyi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YFxgJFKY2COfoPy7wfBysoAtyxOm02qhos1GYeWhutM=;
        b=eZ/kmJ4n5Wvig21ewu3BGn06im7vMwvZdNfPFdqr0NOPO6NtLR8faqqgZS919iaG8A
         syt42HuSbqOvRPBPYXkOEk8o2ohBu4qSzGWzGu9t/H8bf1wGIS2FnsWEKg/LZS6tt/R1
         TS4Wbc/mdsyF9g41H9x6My986KLtn2iNjsOKf2AMW+b6+NPRgeYRDT1JDiI30vGx32Zj
         oBdIvBLwS+BbUVhKZHAcgwgNDL6rGN0rbLDDu/9apCD4Hg2zT/3d60iZo0amYOcLobhX
         mg+YNmGudKKrKuMm59CEikfwZ+/A3SZGtpB/aOXwF0lBc66mVwuTNCyPUiWyY8oPncSB
         cZhQ==
MIME-Version: 1.0
References: <20210503121554.4520-1-zhouzhouyi@gmail.com> <20210503162135.GT975577@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20210503162135.GT975577@paulmck-ThinkPad-P17-Gen-1>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Tue, 4 May 2021 11:16:34 +0800
Message-ID: <CAABZP2yP=Y0iNAjBQeM8RpmziArNXuNziQNxK3CwCADVUYKemA@mail.gmail.com>
Subject: Re: [PATCH -perfbook] Fix the description of rcu_gp_ongoing
Content-Type: text/plain; charset="UTF-8"
To: paulmck@kernel.org
Cc: Yang Lu <luyang.co@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Thanks Paul for your encouragement.

Your encouragement has always been my motivation to keep on studying.

Thanks again
Cheers
Zhouyi

On Tue, May 4, 2021 at 12:21 AM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Mon, May 03, 2021 at 08:15:54PM +0800, Zhouyi Zhou wrote:
> > Hi Paul,
> >
> > I am going to revise Chinese Edition of Appendix with
> > Yang Lu's unreserved help.
> >
> > During the process of reading, I examined the definition of
> > rcu_gp_ongoing in CodeSamples/defer/rcu_nest.h
> > Would it better to describe rcu_gp_ongoing in the book as:
> > 'it checks the set of bits indicated by RCU_GP_CTR_NEST_MASK.' because
> > I think 'it checks the bit indicated by RCU_GP_CTR_BOTTOM_BIT'
> > is a little confusing.
>
> Good eyes, thank you very much!
>
> I just made "bit" be plural, so it now reads "the bits indicated by
> RCU_GP_CTR_NEST_MASK".  Queued and pushed, and again, thank you!
>
>                                                         Thanx, Paul
>
> > Thanks alot
> > Zhouyi Zhou
> >
> > Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> > ---
> >  appendix/toyrcu/toyrcu.tex | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
> > index 8fd2aef0..830e4478 100644
> > --- a/appendix/toyrcu/toyrcu.tex
> > +++ b/appendix/toyrcu/toyrcu.tex
> > @@ -1215,7 +1215,7 @@ adds \co{RCU_GP_CTR_BOTTOM_BIT} to the global \co{rcu_gp_ctr}
> >  instead of adding the constant ``2'',
> >  and the second is that the comparison on \clnref{ongoing}
> >  has been abstracted out to a separate function,
> > -where it checks the bit indicated by \co{RCU_GP_CTR_BOTTOM_BIT}
> > +where it checks the set of bits indicated by \co{RCU_GP_CTR_NEST_MASK}
> >  instead of unconditionally checking the low-order bit.
> >  \end{fcvref}
> >
> > --
> > 2.25.1
> >
