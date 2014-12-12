Return-Path: <bp@alien8.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
 t=1418410059; bh=jzn3yhDSamJASK6ILJGI/tZOUrwkJLNLHiV9vZrjeGM=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
 Content-Type:In-Reply-To; b=ZnCZ4Pi0DeugF1Nn+nLnviTM4R/o1ksodbD2uy
 Tlg/ayMy8xN5CNNmOGzrxm159KLzePWKvT2ErJXB8W4oY/2zIZbQ7a0nzafj1aGOWRn
 0M5JaXtnN+91km+HSmdVSXQM9StluDl+LnVzWjAHaXA7abRiM2DIvLNs3KxC7t8ook=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
 t=1418410059; bh=jzn3yhDSamJASK6ILJGI/tZOUrwkJLNLHiV9vZrjeGM=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
 Content-Type:In-Reply-To; b=ZnCZ4Pi0DeugF1Nn+nLnviTM4R/o1ksodbD2uy
 Tlg/ayMy8xN5CNNmOGzrxm159KLzePWKvT2ErJXB8W4oY/2zIZbQ7a0nzafj1aGOWRn
 0M5JaXtnN+91km+HSmdVSXQM9StluDl+LnVzWjAHaXA7abRiM2DIvLNs3KxC7t8ook=
Date: Fri, 12 Dec 2014 19:47:37 +0100
From: Borislav Petkov <bp@alien8.de>
Subject: Re: perfbook build error
Message-ID: <20141212184737.GE30699@pd.tnic>
References: <20141211190724.GF31140@pd.tnic> <20141211191734.GG31140@pd.tnic>
 <20141211193230.GM25340@linux.vnet.ibm.com> <20141211195922.GH31140@pd.tnic>
 <20141211201014.GN25340@linux.vnet.ibm.com> <20141211202238.GI31140@pd.tnic>
 <20141211211429.GA23711@linux.vnet.ibm.com>
 <20141212163835.GA29275@linux.vnet.ibm.com> <20141212175313.GD30699@pd.tnic>
 <20141212181804.GX25340@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20141212181804.GX25340@linux.vnet.ibm.com>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Fri, Dec 12, 2014 at 10:18:05AM -0800, Paul E. McKenney wrote:
> And I take it that just adding braces doesn't work either, the discussion in
> http://tex.stackexchange.com/questions/102119/why-doesnt-lstinline-work-in-table-column
> notwithstanding?
> 
> 	{\co{struct task_struct}}
> 
> Or:
> 
> 	{ \co{struct task_struct} }

No, neither.

/me searches a bit more, gets lucky...

Apparently, it is still an open bug which seems unresolved even in tex
upstream, AFAICT:

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=752773

I tried the suggested workaround first by replacing \lstinline in

/usr/share/texlive/texmf-dist/tex/latex/listings/listings.sty

with it but it complained about an undefined command. Then I went and
did this:

\newcommand\lstinline[1][]{%
   \leavevmode\bgroup % \hbox\bgroup --> \bgroup
     \def\lst@boxpos{b}%
     \lsthk@PreSet\lstset{flexiblecolumns,#1}%
     \lsthk@TextStyle
     \ifnum\iffalse{\fi`}=\z@\fi
     \@ifnextchar\bgroup{%
        \ifnum`{=\z@}\fi%
        \afterassignment\lst@InlineG \let\@let@token}{%
        \ifnum`{=\z@}\fi\lstinline@}}

and the pdf was built successfully.

Maybe I should let the guys know that it still triggers...

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--

