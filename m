Return-Path: <bp@alien8.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
 t=1418329360; bh=YwIqLjzR1m+mFCcr+J5EytXk6whjCkkhWMxaDgtmPOk=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
 Content-Type:In-Reply-To; b=Qdag8R/E0E+kyxNrPtqnofCgao7inE1PTaqNTf
 ru6ll7eqHbo9/+tF/HBSsexbOk6+r3wiOmmjIg8/5ibrLKx7MGMeRiGRaEwcJK14JPY
 381l3aPQH8/EFwob8jXht+KQFhXbAAZd8YvkAO6SOcDSaDrVLF0/P60mX+eqB1vrHQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
 t=1418329360; bh=YwIqLjzR1m+mFCcr+J5EytXk6whjCkkhWMxaDgtmPOk=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
 Content-Type:In-Reply-To; b=Qdag8R/E0E+kyxNrPtqnofCgao7inE1PTaqNTf
 ru6ll7eqHbo9/+tF/HBSsexbOk6+r3wiOmmjIg8/5ibrLKx7MGMeRiGRaEwcJK14JPY
 381l3aPQH8/EFwob8jXht+KQFhXbAAZd8YvkAO6SOcDSaDrVLF0/P60mX+eqB1vrHQ=
Date: Thu, 11 Dec 2014 21:22:38 +0100
From: Borislav Petkov <bp@alien8.de>
Subject: Re: perfbook build error
Message-ID: <20141211202238.GI31140@pd.tnic>
References: <20141211173210.GE31140@pd.tnic>
 <20141211175248.GK25340@linux.vnet.ibm.com> <20141211190724.GF31140@pd.tnic>
 <20141211191734.GG31140@pd.tnic> <20141211193230.GM25340@linux.vnet.ibm.com>
 <20141211195922.GH31140@pd.tnic> <20141211201014.GN25340@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20141211201014.GN25340@linux.vnet.ibm.com>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Thu, Dec 11, 2014 at 12:10:14PM -0800, Paul E. McKenney wrote:
> > ! Illegal parameter number in definition of \Hy@tempa.
> > <to be read again> 
> >                    d
> > l.876 two \co{#define}
> >                        statements, giving us not one but two ways to create
> > ? 
> > ! Emergency stop.
> > <to be read again> 
> >                    d
> > l.876 two \co{#define}
> >                        statements, giving us not one but two ways to create
> > End of file on the terminal!
> > ---
> 
> That is odd given that URLs really can contain "#"...

I'm reading the error message like it has a problem with the "#" in
"#define" but I might be wrong.

> > Btw, don't waste too much time with it before you can reproduce it
> > yourself and can actually confirm it is a latex issue. I might be
> > missing packages or so... although updating texlive-latex-* works out
> > fine and pulls in whatever it needs.
> > 
> > Btw, it looks like it has trouble with this custom defined command. Built-in
> > stuff works:
> > 
> > ---
> > diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
> > index c98f3a78652f..e227fe7363fb 100644
> > --- a/toolsoftrade/toolsoftrade.tex
> > +++ b/toolsoftrade/toolsoftrade.tex
> > @@ -1242,7 +1242,7 @@ but may be implemented straightforwardly as follows:
> >         \hline
> >         \hline
> >         Thread Management
> > -               & \co{pthread_t}
> > +               & \L test
> 
> I am guessing that \L chokes on underscores, otherwise, it would be an
> attractive alternative to \co{}.  (It does choke on underscores in my
> old environment.)

Yeah, I had to comment out the underscores earlier.

> >                         & \co{struct task_struct} \\
> >         \cline{2-3}
> >                 & \co{pthread_create()}
> > --
> > 
> > I need to investigate more.
> 
> Please let me know how it goes!

Yap, sure.

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--

