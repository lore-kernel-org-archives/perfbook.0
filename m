Return-Path: <andrea.parri@amarulasolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=EkEYTBJqDOF0CmFP5OyRd9sAU/Roa6UQ5929TtCdsgg=;
        b=gJe0AAIfVIcRNIOYfX0VjCmev/elowaSULZMX4fAB8Ee2d3iVOIOea4aEZTQxcgNmW
         pwtfwf04DQ8TmSfeoigLtI21M/Rq2Mte/DOKTQKckahek32wihI9x0SyKIz4i0l63Bcw
         7dpgiDQuLQZlE01eQwViKzoXoC8+z1r65bhWk=
Date: Sat, 27 Oct 2018 02:43:19 +0200
From: Andrea Parri <andrea.parri@amarulasolutions.com>
Subject: Re: perfbook
Message-ID: <20181027004319.GA22818@andrea>
References: <20181025083609.GA6766@andrea>
 <20181025100235.GR4170@linux.ibm.com>
 <20181026202014.GA4905@andrea>
 <8e6bc30b-d35f-e03e-9af4-14398bddf5b1@gmail.com>
 <20181026221402.GA5769@andrea>
 <6e0825ca-560d-4774-ce88-399c72053448@gmail.com>
 <20181026230623.GA11970@andrea>
 <f3f1a05c-c626-0f3a-8591-87fb93ea11ca@gmail.com>
 <2da98be8-9b4a-433d-fd6c-bf882c3ec5f6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2da98be8-9b4a-433d-fd6c-bf882c3ec5f6@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "Paul E. McKenney" <paulmck@linux.ibm.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Sat, Oct 27, 2018 at 09:33:57AM +0900, Akira Yokosawa wrote:
> On 2018/10/27 8:43, Akira Yokosawa wrote:
> > On 2018/10/27 8:06, Andrea Parri wrote:
> >>> And you have a2ping 2.83p, right?  Otherwise, Makefile should
> >>> complain. Hmm???
> >>
> >> Indeed, 2.83p.
> >>
> >>
> >>>
> >>> Can you remove "> /dev/null 2>&1" on line 220 of Makefile,
> >>> and let me know what a2ping should say?
> >>
> >> It says:
> >>
> >> /usr/local/bin/a2ping: not a GS output from gs (0)
> > 
> > Umm, "gs (0)" suggests exit code of gs is 0, which should indicate
> > success. I have no idea what is going on.
> 
> Andrea,
> 
> Do you happen to set some of environment variables:
> 
>     GS_OPTIONS
>     GS_DEVICE
> 
> and the like?

No GS_ variable set.

  Andrea


> 
> Akira
> 
> > 
> > I have a Ubuntu 18.04 virtual machine and a2ping 2.83p works happily
> > there. 
> > 
> > Sorry but I can't help you at the moment.
> > 
> > Akira
> > 
> >>
> >>   Andrea
> >>
> >>
> >>>
> >>> "GPL Ghostscript 9.25: Unrecoverable error, exit code 1" is not
> >>> fatal and can be ignored as far as I know.
> >>>
> >>>       Akira
> > 
> 

