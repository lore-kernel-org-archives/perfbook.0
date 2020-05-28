Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:36212 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725896AbgE1DAG (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Wed, 27 May 2020 23:00:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590634805;
        bh=y/G1wgDS9gk4AsVT1kzljE9BB7FfxdQKkTlIDqxu7NQ=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=gk9VeZhigsCgVea0EvSrQljVsNuhMFahsm58xqhq/obVIKqVjhQVjxwIVkzLFK88q
         0peIKep3R19i1+sJRHEBEEVC9bAHzA62Gjp4rohau+P1qcCgWIe/9WWp4jwmjeiCTR
         k8b71McakVgkomc1xNjVYLG1eLMzGDVZzIeJDkS0=
Date: Wed, 27 May 2020 20:00:05 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 2/2] CodeSamples/formal/herd/absperf-reduce: Enforce
 compare as number
Message-ID: <20200528030005.GD2869@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <7dea1e63-95bf-8d5b-dca2-47e741a5ed48@gmail.com>
 <8c68598d-847a-81c8-4612-66f957627601@gmail.com>
 <20200528005015.GC2869@paulmck-ThinkPad-P72>
 <9d294bb4-ea3f-34d7-a8b6-0825e033b15f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d294bb4-ea3f-34d7-a8b6-0825e033b15f@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, May 28, 2020 at 10:05:06AM +0900, Akira Yokosawa wrote:
> On Wed, 27 May 2020 17:50:15 -0700, Paul E. McKenney wrote:
> > On Thu, May 28, 2020 at 07:44:11AM +0900, Akira Yokosawa wrote:
> >> >From 213bf072d15dfc3dce36b51a8bc1d35bd78e6609 Mon Sep 17 00:00:00 2001
> >> From: Akira Yokosawa <akiyks@gmail.com>
> >> Date: Thu, 28 May 2020 07:25:04 +0900
> >> Subject: [PATCH 2/2] CodeSamples/formal/herd/absperf-reduce: Enforce compare as number
> >>
> >> When there are differences in the number of digits in runtime,
> >> absperf-reduce.sh miscalculates min and max values and shows strange
> >> results such as:
> >>
> >>     C-SB+l-o-o-u+l-o-o-u+l-o-o-u-XE.litmus 13.255 11.81 9.64
> >>                                            (avr)  (min) (max)
> >>
> >> Fix this by adding 0 on both sides of comparison and enforce conversion
> >> to numbers.  After this change:
> >>
> >>     C-SB+l-o-o-u+l-o-o-u+l-o-o-u-XE.litmus 13.255 9.23 15.77
> >>
> >> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > 
> > Applied and pushed both, thank you!
> > 
> > Did any of these runtime errors make their way into the tables in
> > the text?
> 
> I don't think so.  Tables 17.4 and E.5 present averages only.
> 
> I spotted them while I did some absperf runs to compare herd7 7.52 and
> herd7 HEAD during discussions with Andrii.

Thank you for checking, and either way, good eyes!

							Thanx, Paul

>         Thanks, Akira
> 
> > 
> > 							Thanx, Paul
> > 
> >> ---
> >>  CodeSamples/formal/herd/absperf-reduce.sh | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/CodeSamples/formal/herd/absperf-reduce.sh b/CodeSamples/formal/herd/absperf-reduce.sh
> >> index 0c338b8b..9cf52182 100644
> >> --- a/CodeSamples/formal/herd/absperf-reduce.sh
> >> +++ b/CodeSamples/formal/herd/absperf-reduce.sh
> >> @@ -16,9 +16,9 @@ awk '
> >>  		gsub(/user .*$/, "", curtesttime);
> >>  		testtime_n[curtest]++;
> >>  		testtime_sum[curtest] += curtesttime;
> >> -		if (testtime_max[curtest] == "" || curtesttime > testtime_max[curtest])
> >> +		if (testtime_max[curtest] == "" || curtesttime + 0 > testtime_max[curtest] + 0)
> >>  			testtime_max[curtest] = curtesttime;
> >> -		if (testtime_min[curtest] == "" || curtesttime < testtime_min[curtest])
> >> +		if (testtime_min[curtest] == "" || curtesttime + 0 < testtime_min[curtest] + 0)
> >>  			testtime_min[curtest] = curtesttime;
> >>  	}
> >>  }
> >> -- 
> >> 2.17.1
> >>
> >>
