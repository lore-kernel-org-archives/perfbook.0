Return-Path: <andrea.parri@amarulasolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=93A9DetcQc9vPRAt8RR6V5wH/wNBVgs9pHFmYoob104=;
        b=SLjYeN2TyU9QLgsPkqsjwFbT+blE2AQ8O+PzMohRcvKfpHX8QWAX696dJEecUiWs9L
         zgjQwzHW1BCn/ZF8iPF9vWx+gIp/pZsE1rYjTQHuxycRTjkt4U5snKHhsJMsa3AYguQ+
         c4ykkUxxX+D65XsvQ9nVamFBczbY9fOWGkqY8=
Date: Sat, 27 Oct 2018 00:14:02 +0200
From: Andrea Parri <andrea.parri@amarulasolutions.com>
Subject: Re: perfbook
Message-ID: <20181026221402.GA5769@andrea>
References: <20181025083609.GA6766@andrea>
 <20181025100235.GR4170@linux.ibm.com>
 <20181026202014.GA4905@andrea>
 <8e6bc30b-d35f-e03e-9af4-14398bddf5b1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e6bc30b-d35f-e03e-9af4-14398bddf5b1@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "Paul E. McKenney" <paulmck@linux.ibm.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Sat, Oct 27, 2018 at 06:02:02AM +0900, Akira Yokosawa wrote:
> On 2018/10/26 13:58:45 -0700, Andrea Parri wrote:
> > On Thu, Oct 25, 2018 at 03:02:35AM -0700, Paul E. McKenney wrote:
> >> On Thu, Oct 25, 2018 at 10:36:09AM +0200, Andrea Parri wrote:
> >>> Hi Paul,
> >>>
> >>> could you forward me the info about perfbook you sent last week
> >>> including the PDF?  I did try to compile from the repo but have
> >>> not been successful yet: here's the last one.
> >>>
> >>> sh ./utilities/gen_snippet_d.sh
> >>> sh utilities/autodate.sh >autodate.tex
> >>> CodeSamples/SMPdesign/smpalloc.canonical.eps --> CodeSamples/SMPdesign/smpalloc.canonical.pdf
> >>> Makefile:211: recipe for target 'CodeSamples/SMPdesign/smpalloc.canonical.pdf' failed
> >>> make: *** [CodeSamples/SMPdesign/smpalloc.canonical.pdf] Error 255
> >>
> >> Hello, Andrea,
> >>
> >> Please see attached for the current PDF.  It looks to me like you are
> >> missing one of the required packages, which are listed in FAQ-BUILD.txt
> >> in the perfbook repo.
> >>
> >> Adding the perfbook email list in case someone has more exact advice.  ;-)
> > 
> > Thanks.
> > 
> > Please let me know if I should provide info about my setup/log.
> 
> Hello Andrea,
> 
> The commands involved in the failed recipe is "a2ping".
> It invokes "gs" (Ghostscript) internally.
> 
> Current Makefile does not check the existence of "gs".
> Do your system have Ghostscript installed?

Hi Akira.  Yes, I have v9.25 (2018-03-21) from ubuntu 18.04.

  Andrea


> 
>         Thanks, Akira
>  
> 
> > 
> >   Andrea
> > 
> > 
> >>
> >> 							Thanx, Paul
> > 
> > 
> 

