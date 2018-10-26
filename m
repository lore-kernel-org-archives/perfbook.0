Return-Path: <andrea.parri@amarulasolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tiMo0OqRtPih92lMuHeexnt8BjgM4blkqoTkijnyOMs=;
        b=D3B8KFSAJCwiS7B6fjo8Iy84EEzuyMuSHeIlC8By7iRVg2J+bY3M7FemOol925TdQ3
         VqQlk2413aoebvtYA6deLZVEmE9YknbW8yitr7eLFdF52AmHKNMzD/WHjWcOIE3w7Lyy
         kNpuWBRH8egjPGwxACqvxiuBlVTeRZKrW4wNU=
Date: Fri, 26 Oct 2018 22:20:15 +0200
From: Andrea Parri <andrea.parri@amarulasolutions.com>
Subject: Re: perfbook
Message-ID: <20181026202014.GA4905@andrea>
References: <20181025083609.GA6766@andrea>
 <20181025100235.GR4170@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181025100235.GR4170@linux.ibm.com>
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Thu, Oct 25, 2018 at 03:02:35AM -0700, Paul E. McKenney wrote:
> On Thu, Oct 25, 2018 at 10:36:09AM +0200, Andrea Parri wrote:
> > Hi Paul,
> > 
> > could you forward me the info about perfbook you sent last week
> > including the PDF?  I did try to compile from the repo but have
> > not been successful yet: here's the last one.
> > 
> > sh ./utilities/gen_snippet_d.sh
> > sh utilities/autodate.sh >autodate.tex
> > CodeSamples/SMPdesign/smpalloc.canonical.eps --> CodeSamples/SMPdesign/smpalloc.canonical.pdf
> > Makefile:211: recipe for target 'CodeSamples/SMPdesign/smpalloc.canonical.pdf' failed
> > make: *** [CodeSamples/SMPdesign/smpalloc.canonical.pdf] Error 255
> 
> Hello, Andrea,
> 
> Please see attached for the current PDF.  It looks to me like you are
> missing one of the required packages, which are listed in FAQ-BUILD.txt
> in the perfbook repo.
> 
> Adding the perfbook email list in case someone has more exact advice.  ;-)

Thanks.

Please let me know if I should provide info about my setup/log.

  Andrea


> 
> 							Thanx, Paul


