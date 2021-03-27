Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:58724 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229990AbhC0Qdt (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sat, 27 Mar 2021 12:33:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616862829;
        bh=gkC3262xZZXIgG7KpypsbymVKYEMJS8iYyL03SUuUoQ=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=iv8Iu8pFkI978YCX+3V2JbvJ6oEtqiPAFd2iKV/cWiFfssDU3T0n77pt3VxTYirLf
         Pz/PGKyrlREUUwxRhkq0uA78AgcvpEkaadFSiIfxbmGrwnWETn8robED1Gw7J7nTWS
         mrgdn/y6pekWdGviIBEJWisHc2mYbpqUg5Ge1aQa+qVidBjZdK0UjDayt8QFDZtlCE
         7Dqveo6OqFrBp5gg2QTLnE4A89LulyugoqaBQF9edCUDeQPdbEo8kYRr8+vrM1/xPp
         OYR0Gm1EYUS3T2fjzz7JMgvhlDUHGWaMmfXwvXEyWCR7CbFUr+x1Jp4QcuwIGAyCfH
         p+aA1wBiT2q9w==
Date: Sat, 27 Mar 2021 09:33:48 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 5/5] Makefile: Add info on ebooksize build in
 help and help-full
Message-ID: <20210327163348.GR2696@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20210323010153.GH77072@balbir-desktop>
 <64419413-f54f-a737-bcae-e03b8ecaf606@gmail.com>
 <7c31e637-8a04-672d-71e5-3a3009e182f3@gmail.com>
 <20210326063503.GO77072@balbir-desktop>
 <adfa150b-0cc9-034f-0e13-80e7d19502de@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adfa150b-0cc9-034f-0e13-80e7d19502de@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Balbir Singh <bsingharora@gmail.com>, perfbook@vger.kernel.org

On Fri, Mar 26, 2021 at 08:42:05PM +0900, Akira Yokosawa wrote:
> On Fri, 26 Mar 2021 17:35:03 +1100, Balbir Singh wrote:
> > On Thu, Mar 25, 2021 at 08:00:07PM +0900, Akira Yokosawa wrote:
> >> "(WIP)" will be removed size adjustments of floats are done.
> >>
> >> Also promote paper-size specific targets to "make help".
> >>
> >> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> >> ---
> >>  Makefile | 11 ++++++++++-
> >>  1 file changed, 10 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/Makefile b/Makefile
> >> index 415bcef3..16c85edf 100644
> >> --- a/Makefile
> >> +++ b/Makefile
> >> @@ -500,8 +500,15 @@ help: help-official
> >>  	@echo "Set env variable PERFBOOK_PAPER to change paper size:"
> >>  	@echo "   PERFBOOK_PAPER=A4: a4paper"
> >>  	@echo "   PERFBOOK_PAPER=HB: hard cover book"
> >> +	@echo "   PERFBOOK_PAPER=EB: ebook reader, always 1c layout (WIP)"
> >>  	@echo "   other (default):   letterpaper"
> >>  	@echo
> >> +	@echo "Paper size variations (independent of PERFBOOK_PAPER):"
> >> +	@echo "  perfbook-lt.pdf,   lt:   2-column layout on letterpaper"
> >> +	@echo "  perfbook-hb.pdf,   hb:   2-column layout for hard cover book"
> >> +	@echo "  perfbook-a4.pdf,   a4:   2-column layout on a4paper"
> >> +	@echo "  perfbook-eb.pdf,   eb:   1-column layout for ebook reader (WIP)"
> >> +	@echo
> >>  	@echo "\"make help-full\" will show the full list of available targets."
> >>  
> >>  help-full: help-official
> >> @@ -510,6 +517,7 @@ help-full: help-official
> >>  	@echo "  perfbook-lt.pdf,   lt:   2-column layout on letterpaper"
> >>  	@echo "  perfbook-hb.pdf,   hb:   2-column layout for hard cover book"
> >>  	@echo "  perfbook-a4.pdf,   a4:   2-column layout on a4paper"
> >> +	@echo "  perfbook-eb.pdf,   eb:   1-column layout for ebook reader (WIP)"
> >>  	@echo
> >>  	@echo "Experimental targets:"
> >>  	@echo "  Full,              Abbr."
> >> @@ -540,8 +548,9 @@ help-full: help-official
> >>  	@echo "  - Set env variable PERFBOOK_PAPER to change paper size:"
> >>  	@echo "      PERFBOOK_PAPER=A4: a4paper"
> >>  	@echo "      PERFBOOK_PAPER=HB: hard cover book"
> >> +	@echo "      PERFBOOK_PAPER=EB: ebook reader, always 1c layout (WIP)"
> >>  	@echo "      other (default):   letterpaper"
> >> -	@echo "    (PERFBOOK_PAPER has no effect on targets \"lt\", \"hb\", and \"a4\".)"
> >> +	@echo "    (PERFBOOK_PAPER has no effect on targets \"lt\", \"hb\", \"a4\", and \"eb\".)"
> >>  
> >>  clean:
> >>  	find . -name '*.aux' -o -name '*.blg' \
> >> -- 
> >> 2.17.1
> >>
> > 
> > Acked-by: Balbir Singh <bsingharora@gmail.com> 
> > 
> 
> Thanks, to be applied to 5/5.
> 
> Paul, what is your idea on this patch set?
> I can send a v2 with Balbir's acked-by,
> but apparently, you can directly pick it.
> 
> And to which branch are you going to push?
> For example, shrinking floats can be done on a topic branch,
> for example named "ebooksize", and will be merged later once
> the build warnings are all resolved.
> 
> Another idea is to merge it now, because existing build
> targets won't be affected by this and later changes.

Given that we are very early in the third edition and given that "eb"
is clearly marked "WIP" in the "make help" output, I am fine just taking
improvements as they come.

So I just now pushed out the series with Balbir's ack on your commit
updating "make help".

							Thanx, Paul
