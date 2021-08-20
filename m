Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:35274 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237618AbhHTCzF (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Thu, 19 Aug 2021 22:55:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629428068;
        bh=Q5PxXG4bJBxm2ta5hGc41yY/4R8a+5hL7rak1QgF3bw=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=GXL92r8/fizDXE9SUvuZHWHCTidxnZvh+YdEknIH9PoypR0B6+wHJ2kMBZOvWwh3u
         HqwW0Yw3MU2UjEvahLN7Bmo28bfPXoc0lc+dv0/xYtzUNMVdmLgvk6kPev3yzsCw6k
         ZyDdJdJl2+i9tnpsu1WFPKggx88vesFEdTbtR7yFbo1xFlrfEWdKS+90io5wgwdst6
         dhcWNcuKD2jfMKwo0mJof96nwmPtaS7vBNem2KeUS42dGJe/78ZLpWD06uWHAVWKRT
         E1iueSkUWzCP33kq9uDp5BA/6pHO22rfhJiETsB3+n3XeJSCKzAz9c+A5skg3gtPT5
         f2tN+tCieVHKg==
Date: Thu, 19 Aug 2021 19:54:28 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH-perfbook] Fix a little grammar mistake
Message-ID: <20210820025428.GG4126399@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <1629359518-3861-1-git-send-email-zhouzhouyi@gmail.com>
 <031ce7cf-750e-7a2d-f2ba-5e7b661df2c2@gmail.com>
 <20210819172940.GD4126399@paulmck-ThinkPad-P17-Gen-1>
 <6751500e-62ed-3bcb-fe9f-290a826ed8da@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6751500e-62ed-3bcb-fe9f-290a826ed8da@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>, perfbook@vger.kernel.org, luyang.co@gmail.com

On Fri, Aug 20, 2021 at 08:43:13AM +0900, Akira Yokosawa wrote:
> On Thu, 19 Aug 2021 10:29:40 -0700, Paul E. McKenney wrote:
> > On Thu, Aug 19, 2021 at 07:54:30PM +0900, Akira Yokosawa wrote:
> >> Hello Zhouyi,
> >>
> >> On Thu, 19 Aug 2021 15:51:58 +0800, Zhouyi Zhou wrote:
> >>> Hi Paul,
> >>>
> >>> I think there is a little grammer mistake in answer to quick quiz 10.8,
> >>> I am not so sure because my English is not so well ;-)
> >>>
> >>> Thanks
> >>> Zhouyi
> >>>
> >>> Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> >>> ---
> >>>  datastruct/datastruct.tex | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
> >>> index adb102d..68341f2 100644
> >>> --- a/datastruct/datastruct.tex
> >>> +++ b/datastruct/datastruct.tex
> >>> @@ -963,1 +963,1 @@ not recommended for production use.
> >>>  	In theory, it isn't any safer, and a useful exercise would be
> >>> 	to run these programs on larger systems.
> >>>  	In practice, there are a lot more systems with more than 28~CPUs
> >>> -	than there are systems with more than 448 CPUs.
> >>
> >> This can be parsed as follows:
> >>
> >>     In practice, there are a lot more X than there are Y.
> >>
> >> , where
> >>
> >>     X: systems with more than 28~CPUs
> >>     Y: systems with more than 448 CPUs
> >>
> >> So there is no grammatical error here.
> >> Three uses of "than" in a sentence might be confusing, though.
> >>
> >> Paul might have an idea of a less-confusing sentence.
> > 
> > Three "than"s in one sentence is a bit excessive, now that you guys
> > mention it.
> > 
> > How about this?
> > 
> > 	In practice, there are a lot more 28-CPU systems than there are
> > 	448-CPU systems.
> > 
> > I do not believe that the "more than"s are really adding much here.
> 
> Well, the question part reads:
> 
> > The dangers of extrapolating from 28 CPUs to 448 CPUs was made quite
> > clear in Section 10.2.3. But why should extrapolating up from 448 CPUs be
> > any safer?
> 
> So, the point is "extrapolating up from 448 CPUs".
> Hence you used "more than"s in the answer, didn't you?

Right you are, and thank you for checking this!

There are several possibilities:

	In practice, there are a lot more systems with in excess of
	28~CPUs than there are systems with in excess of 448 CPUs.

Or:

	In practice, there are only a very few systems with more than
	448 CPUs, while there is a huge number having more than 28 CPUs.

Or perhaps rework the full answer:

	In theory, it isn't any safer, and a useful exercise would be
	to run these programs on larger systems.
	In practice, there are only a very few systems with more than
	448 CPUs, in contrast to the huge number having more than 28 CPUs.
	This means that although it is dangerous to extrapolate beyond
	448 CPUs, there is very little need to do so.
	In addition, other testing has shown that RCU read-side primitives
	offer consistent performance and scalability up to at least 1024 CPUs.

Thoughts?

							Thanx, Paul

>         Thanks, Akira
> 
> > 
> > Thoughts?
> > 
> > 							Thanx, Paul
> > 
> >>         Thanks, Akira 
> >>
> >>> +	are systems with more than 448 CPUs.
> >>>  	In addition, other testing has shown that RCU read-side primitives
> >>>  	offer consistent performance and scalability up to at least 1024 CPUs.
> >>>  }\QuickQuizEnd
> >>>
