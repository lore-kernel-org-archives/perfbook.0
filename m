Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236801AbiF0OLN (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 27 Jun 2022 10:11:13 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B5A613E91
        for <perfbook@vger.kernel.org>; Mon, 27 Jun 2022 07:11:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4BE7CB8172B
        for <perfbook@vger.kernel.org>; Mon, 27 Jun 2022 14:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656339068;
        bh=jaNE8ndiB3CKcEQSZF+XnNFr1qNjVD3GGIZ/pFasffo=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=ixk75pnQQuoAx5IocGtW/eSxXqM2VkSEz/eKrgUtOsOEvveyfc8yqOJIn6RKTrCjo
         w5JkN83E8R0ryTg+Kvqs9xAPDkMEU4LFGmVHzFK7NOSobhDqvzOFfp2j3lmBne7ZxV
         JEMRnZ9DJuZgMVjgLr6GiF1W1mIxCXhj04PAj7PwgFBsEIm66GGOSTwrwwTxJrvOXP
         9wL2t/PhwTQ5qOtx6Tb1acq+j4DRVuoAjbW2vyudWz9UFluXGdDJX7QoR7wSK8Ec3F
         dhV1Jgp/f8SI9pEqfuX7VYZe84HBTXH74NF3jJD98Yqwedple9PuETDXEQcps2RwaQ
         By5lxnv3l/Oyw==
Date: Mon, 27 Jun 2022 07:11:06 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Is parallel programing hard...
Message-ID: <20220627141106.GD1790663@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <32CE6D0C-1D26-423E-8A7F-AAC47B085DFF@illinois.edu>
 <20220626030351.GI1790663@paulmck-ThinkPad-P17-Gen-1>
 <efc0a14f-2265-39b7-8d57-b2a6a35e0b46@gmail.com>
 <4004322A-4FF7-435F-8427-A01621C106B1@illinois.edu>
 <0b12a2ee-5edd-d169-2b8c-1a403df7e34c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b12a2ee-5edd-d169-2b8c-1a403df7e34c@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "perfbook@vger.kernel.org" <perfbook@vger.kernel.org>, "Snir, Marc" <snir@illinois.edu>

On Mon, Jun 27, 2022 at 07:32:29PM +0900, Akira Yokosawa wrote:
> On Sun, 26 Jun 2022 18:52:26 +0000, Snir, Marc wrote:
> > lm is installed
> > 
> >> On Jun 25, 2022, at 11:12 PM, Akira Yokosawa <akiyks@gmail.com <mailto:akiyks@gmail.com>> wrote:
> >>
> >> On Sat, 25 Jun 2022 20:03:51 -0700, Paul E. McKenney wrote:
> >>> [ Adding the perfbook email list on CC. ]
> >>>
> >>
> >>> On Sun, Jun 26, 2022 at 02:00:40AM +0000, Snir, Marc wrote:
> >>>> Hi:
> >>>> I got a fatal latex error trying to create the pdf on my own. I append
> >>>> below the last lines of the log and the full log. Latex seems to fail
> >>>> soon after \maketitle
> >>>
> >>> This is a new one on me!
> >>>
> >>> One workaround is to us int Dockerfile template under the docker/
> >>> subdirectory. This is described in question 13 in FAQ-BUILD.txt
> >>> in the top-level directory.
> >>>
> >>> What environment are you running in? There are quirks for a few
> >>> of them.
> >>>
> >>>> I send this FYI, in case it might help you; I loaded the pdf file,
> >>>> and this works for me.
> >>>
> >>> Glad the PDF file worked!
> >>>
> >>> Which reminds me, it is past time for me to do another release.
> >>>
> >>>> Thanks for putting all this material on the web.
> >>>
> >>> Glad you like it, and I hope that it proves helpful!
> >>>
> >>> Thanx, Paul
> >>>
> >>>> Marc
> >>
> >> Hi Marc,
> >>
> >> I see in your log, you are using vanilla TeX Live 2022.
> >>
> >> I'm regularly building with vanilla TeX Live, and have not seen
> >> such an error.
> >>
> >>>>
> >>>>
> >>>>
> >>>>
> >>>>
> >>>> (/usr/local/texlive/2022/texmf-dist/tex/latex/newtx/ts1ntxtlf.fd
> >>>> File: ts1ntxtlf.fd 2015/01/18 v1.0 fd file for TS1/ntxtlf
> >>>> )
> >>>> LaTeX Font Info: Font shape `TS1/ntxtlf/m/n' will be
> >>>> (Font) scaled to size 12.0pt on input line 605.
> >>>> LaTeX Font Info: Font shape `TS1/ntxtlf/m/n' will be
> >>>> (Font) scaled to size 8.8pt on input line 605.
> >>>> LaTeX Font Info: Font shape `TS1/ntxtlf/m/n' will be
> >>>> (Font) scaled to size 6.6pt on input line 605.
> >>>>
> >>>>
> >>>> ! LaTeX Error: There's no line here to end.
> >>
> >> In my build, messages in the log around here proceeds as follows:
> >>
> >> (/usr/local/texlive/2022/texmf-dist/tex/latex/newtx/ts1ntxtlf.fd
> >> File: ts1ntxtlf.fd 2015/01/18 v1.0 fd file for TS1/ntxtlf
> >> )
> >> LaTeX Font Info: Font shape `TS1/ntxtlf/m/n' will be
> >> (Font) scaled to size 12.0pt on input line 607.
> >> LaTeX Font Info: Font shape `TS1/ntxtlf/m/n' will be
> >> (Font) scaled to size 8.8pt on input line 607.
> >> LaTeX Font Info: Font shape `TS1/ntxtlf/m/n' will be
> >> (Font) scaled to size 6.6pt on input line 607.
> >> LaTeX Font Info: Trying to load font information for T1+lmtt on input line 6
> >> 07.
> >>
> >> (/usr/local/texlive/2022/texmf-dist/tex/latex/lm/t1lmtt.fd
> >> File: t1lmtt.fd 2015/05/01 v1.6.1 Font defs for Latin Modern
> >> )
> >>
> >> I think "Latin Modern" font is one of essential font packages on TeX Live
> >> these days, but do you have the "lm" font package installed on your system?
> >>
> >> Thanks, Akira
> 
> For the record:
> 
> It turns out that Marc attempted the build under macOS 12.4, which
> resulted in a corrupted autodate.tex.
> It means utilities/autodate.sh doesn't work as expected under macOS.
> 
> The cause might be the difference of primitive tools such as "date",
> "sed", and "grep".  We assume those from GNU, while macOS has those
> of BSD origin.
> 
> As I don't have a macOS system at my disposal, I can't help further.
> 
> (I was surprised to know that the build scripts worked without a fatal
> error until the first run of pdflatex.)

In theory, it is possible to use the "findutils" and "brew" commands to
set up gnu utilities on MacOS, and to do so such that your PATH variable
can be used to choose whether the default is the MacOS versions or the
gnu versions.  Or so it says here:

https://www.google.com/search?q=latex+on+macos&oq=latex+on+macos&aqs=chrome..69i57j0i22i30l9.3869j1j7&client=ubuntu&sourceid=chrome&ie=UTF-8

I do have an old MacOS system, but it is at home and I am on travel.
I would need to install LaTeX on it (last time I tried, the installation
hung), but Marc proved that it is possible to actually install it.  ;-) If
I can pass that hurdle, I will try making perfbook use the gnu utilities.

Or is this where someone tells me that  LaTeX on MacOS make use of
scripts that rely on the MacOS variants of these commands?  ;-)

Thoughts?

							Thanx, Paul

> >>>> See the LaTeX manual or LaTeX Companion for explanation.
> >>>> Type H <return> for immediate help.
> >>>> ...
> >>>>
> >>>> l.605 \IfTwoColumn
> >>>> {
> >>>> ?
> >>>> ! Emergency stop.
> >>>> ...
> >>>>
> >>>> l.605 \IfTwoColumn
> >>>> {
> >>>> Your command was ignored.
> >>>> Type I <command> <return> to replace it with another command,
> >>>> or <return> to continue without it.
> > 
