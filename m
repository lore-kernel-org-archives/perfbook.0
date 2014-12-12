Return-Path: <bp@alien8.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
 t=1418406794; bh=BgS8eaWIHyMG4azceevlrzOBhjjUG717uTv8uuImdVQ=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
 Content-Type:In-Reply-To; b=lmqfPRcoNVs7mwgWyEnQDjt5W2VQxMDKDVRNEH
 EP/H3kf4shHEBIXlxNirRHAE4dBUKPcSpjhPpdof7HbAIKoW7dK9S0TRbyxI50jW5PO
 TfhoTaauI+z0n92VJx80F0ANkxSqp43MYmyLTwOoLicguH0kKMOdToQfC6SmYdVfHY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
 t=1418406794; bh=BgS8eaWIHyMG4azceevlrzOBhjjUG717uTv8uuImdVQ=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
 Content-Type:In-Reply-To; b=lmqfPRcoNVs7mwgWyEnQDjt5W2VQxMDKDVRNEH
 EP/H3kf4shHEBIXlxNirRHAE4dBUKPcSpjhPpdof7HbAIKoW7dK9S0TRbyxI50jW5PO
 TfhoTaauI+z0n92VJx80F0ANkxSqp43MYmyLTwOoLicguH0kKMOdToQfC6SmYdVfHY=
Date: Fri, 12 Dec 2014 18:53:13 +0100
From: Borislav Petkov <bp@alien8.de>
Subject: Re: perfbook build error
Message-ID: <20141212175313.GD30699@pd.tnic>
References: <20141211173210.GE31140@pd.tnic>
 <20141211175248.GK25340@linux.vnet.ibm.com> <20141211190724.GF31140@pd.tnic>
 <20141211191734.GG31140@pd.tnic> <20141211193230.GM25340@linux.vnet.ibm.com>
 <20141211195922.GH31140@pd.tnic> <20141211201014.GN25340@linux.vnet.ibm.com>
 <20141211202238.GI31140@pd.tnic> <20141211211429.GA23711@linux.vnet.ibm.com>
 <20141212163835.GA29275@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20141212163835.GA29275@linux.vnet.ibm.com>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Fri, Dec 12, 2014 at 08:38:35AM -0800, Paul E. McKenney wrote:
> Does wrapping the \co{} in mbox help?  Please see the patch below for
> an example.
> 
> Your environment apparently does handle \co{} in other environments,
> as there are a lot of them in Chapter 1.  So if mbox fixes it for you,
> I would be OK mboxing all the \co{}s in tables.
> 
> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
> index c98f3a78652f..a5b530fc989e 100644
> --- a/toolsoftrade/toolsoftrade.tex
> +++ b/toolsoftrade/toolsoftrade.tex
> @@ -1242,7 +1242,7 @@ but may be implemented straightforwardly as follows:
>  	\hline
>  	\hline
>  	Thread Management
> -		& \co{pthread_t}
> +		& \mbox{\co{pthread_t}}
>  			& \co{struct task_struct} \\
>  	\cline{2-3}
>  		& \co{pthread_create()}

Nope, that doesn't help :-(

! Missing { inserted.
<inserted text> 
                {
l.1246                  &
            \mbox{\co{struct task_struct}} \\
? 
! Emergency stop.
<inserted text> 
                {
l.1246                  &
            \mbox{\co{struct task_struct}} \\
End of file on the terminal!

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--

