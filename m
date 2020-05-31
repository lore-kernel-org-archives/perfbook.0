Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:53558 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725912AbgEaQuY (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sun, 31 May 2020 12:50:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590943824;
        bh=gpJhpc3HaJlrooyo6mt9vf0Y5kVQACqz0GC3ERSszYw=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=Y7+MeZQMbLfmfhAubAur8l8fhoZT2RU/UeODBAsT9RP095imQWLvnAF4WMKJksEP0
         F9cVDZ0DYDn6BdhC/4A4AB81bjOv0sO7qVTcJa0em+ICMB6ZcIaDSq8227MLq6tyzL
         IWutb7s8ouaSB9hY32z07OteP++qWF5YJIZdg6Go=
Date: Sun, 31 May 2020 09:50:23 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 0/3] defer: misc updates
Message-ID: <20200531165023.GL2869@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <64483a19-eee6-f406-7456-01feb232d019@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64483a19-eee6-f406-7456-01feb232d019@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, May 31, 2020 at 09:30:44AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> This is misc updates in response to your recent updates.
> 
> Patch 1/3 treats QQZ annotations for "nq" build.

Good reminder, thank you!

> Patch 2/3 adds a paragraph in #9 of FAQ.txt.  The wording may need
> your retouch for fluency.
> Patch 3/3 is an independent improvement of runlatex.sh.  It will avoid
> a few redundant runs of pdflatex when you have some typo in labels/refs.

Nice, queued and pushed, thank you!

> Another suggestion to Figures 9.25 and 9.29.
> Wouldn't these graphs look better with log scale x-axis?
> 
> X range can be 0.001 -- 10.
> 
> You'll need to add a few data points in sub-microsecond critical-section
> duration to show plausible shapes in those regions, though.

I took a quick look and didn't find any nanosecond delay primitives
in the Linux kernel, but yes, that would be nicer looking.

I don't expect to make further progress on this particular graph
in the immediate future, but if you know of such a delay primitive,
please don't keep it a secret!  ;-)

						Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (3):
>   defer: Annotate consecutive QQZs as such for 'nq' build
>   FAQ.txt: Advertise 'nq' build in #9
>   runlatex.sh: Give up early on undefined refs
> 
>  FAQ.txt               |  8 ++++++--
>  defer/rcuusage.tex    | 20 +++++++++++---------
>  utilities/runlatex.sh | 42 +++++++++++++++++++++++++-----------------
>  3 files changed, 42 insertions(+), 28 deletions(-)
> 
> -- 
> 2.17.1
> 
