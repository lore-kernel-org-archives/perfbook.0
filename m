Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjHCVaU (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 3 Aug 2023 17:30:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBC3D2D4C
        for <perfbook@vger.kernel.org>; Thu,  3 Aug 2023 14:30:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5AFE761EB3
        for <perfbook@vger.kernel.org>; Thu,  3 Aug 2023 21:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691098216;
        bh=A2r98sY/0zaM9t2+g3yE8j5km8N+6QQvb01pB4DtdBk=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=YmLj++8nyKK7RY4KGlr7ticNPvDrs8k+HORr8slbbFKn2unYFCVTWnzjOrwF4Q5Tg
         4rFVOHq6Yz6gqtGtNOaOL0uuuD+nRQxnopwnJArgnD2K8VQJFF55DLQ5HWpw/0LlJ6
         iean2z6uNA2y7R5ohqW6UamAfQKCHyO+TsCatHnaezR75v/GkaZJkgXCFN1tzxIBB0
         /5rNLZFT/0e+Ks9ZifFsy/3hcvwUoiyZchCGRRgM2yYKo8H9PhBGDfgkb5Lvb+AnU9
         rFokORNqib+qY5EewlZHqddQsMJ+Lr0iG/4uAOpgoH0CMazH+UyZZG9aL2p9SZhH9F
         P4oBrx41t66lQ==
Date: Thu, 3 Aug 2023 14:30:15 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 1/5] bib: Use links to lore.kernel.org for LKML
 archive
Message-ID: <204fd5d9-842a-44cd-96c1-3147c773c999@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <f0451f2b-bae3-a0b1-6d71-45d434d27b0f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0451f2b-bae3-a0b1-6d71-45d434d27b0f@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Aug 04, 2023 at 12:08:03AM +0900, Akira Yokosawa wrote:
> Links to http://lkml.iu.edu/hypermail/, https://lkml.org/lkml,
> and https://marc.info have their own ways of indexing mail messages
> (not based on message-ids).
> 
> It should be better to use message-id based URLs for forward
> compatibility.
> 
> As lore.kernel.org is expected to be stable and reliable going
> forward, remove "lastchecked" and "[Viewed MMMM DD, YYYY]" fields
> along the way.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Very nice, and a lot of work, thank you!!!  Queued and pushed.

							Thanx, Paul

> ---
>  bib/RCU.bib      | 120 +++++++++++++++++------------------------------
>  bib/hw.bib       |   3 +-
>  bib/os.bib       |   8 ++--
>  bib/realtime.bib |   6 +--
>  bib/swtools.bib  |   3 +-
>  bib/syncrefs.bib |   2 +-
>  howto/howto.tex  |   2 +-
>  7 files changed, 51 insertions(+), 93 deletions(-)
> 
> diff --git a/bib/RCU.bib b/bib/RCU.bib
> index 2702c6f988be..34ea774e18c2 100644
> --- a/bib/RCU.bib
> +++ b/bib/RCU.bib
> @@ -338,8 +338,7 @@ Orran Krieger and Rusty Russell and Dipankar Sarma and Maneesh Soni",
>   month="October",
>   year="2001",
>   note="URL:
> -\url{http://lkml.iu.edu/hypermail/linux/kernel/0110.1/0410.html}",
> - lastchecked="November 15, 2016",
> +\url{https://lore.kernel.org/lkml/000901c150e2$97765470$010411ac@local/}",
>  }
>  
>  @unpublished{LinusTorvalds2001a,
> @@ -347,10 +346,9 @@ Orran Krieger and Rusty Russell and Dipankar Sarma and Maneesh Soni",
>   Title="{Re:} {[Lse-tech]} {Re:} {RFC:} patch to allow lock-free traversal of lists with insertion",
>   month="October",
>   year="2001",
> - note="URL:
> -\url{https://lkml.org/lkml/2001/10/13/105},
> -\url{https://lkml.org/lkml/2001/10/13/82}",
> - lastchecked="November 19, 2016",
> + note="URLs:
> +\url{https://lore.kernel.org/lkml/Pine.LNX.4.33.0110131015410.8707-100000@penguin.transmeta.com/},
> +\url{https://lore.kernel.org/lkml/Pine.LNX.4.33.0110131024480.8707-100000@penguin.transmeta.com/}",
>  }
>  
>  @unpublished{Blanchard02a,
> @@ -429,8 +427,7 @@ Andrea Arcangeli and Andi Kleen and Orran Krieger and Rusty Russell",
>   month="October",
>   year="2002",
>   note="Available:
> -\url{https://lkml.org/lkml/2002/10/24/262}
> -[Viewed February 15, 2014]",
> +\url{https://lore.kernel.org/lkml/3DB86B05.447E7410@us.ibm.com/}",
>  }
>  
>  @unpublished{LinusTorvalds2003a,
> @@ -439,8 +436,7 @@ Andrea Arcangeli and Andi Kleen and Orran Krieger and Rusty Russell",
>   month="March",
>   year="2003",
>   note="Available:
> -\url{https://lkml.org/lkml/2003/3/9/205}
> -[Viewed March 13, 2006]",
> +\url{https://lore.kernel.org/lkml/Pine.LNX.4.44.0303091831560.2129-100000@home.transmeta.com/}",
>  }
>  
>  @article{Appavoo03a,
> @@ -637,7 +633,7 @@ Oregon Health and Sciences University",
>   day="8",
>   month="August",
>   year="2004",
> - note="\url{https://lkml.org/lkml/2004/8/6/228}",
> + note="\url{https://lore.kernel.org/lkml/20040807191841.GC3936@in.ibm.com/}",
>  }
>  
>  @unpublished{DipankarSarma2004RCU-bh-route-cache,
> @@ -646,7 +642,7 @@ Oregon Health and Sciences University",
>   day="8",
>   month="August",
>   year="2004",
> - note="\url{https://lkml.org/lkml/2004/8/6/231}",
> + note="\url{https://lore.kernel.org/lkml/20040807192023.GD3936@in.ibm.com/}",
>  }
>  
>  @unpublished{PaulEMcKenney2004rcu:dereference,
> @@ -655,8 +651,7 @@ Oregon Health and Sciences University",
>   month="August",
>   year="2004",
>   note="Available:
> -\url{https://lkml.org/lkml/2004/8/6/237}
> -[Viewed June 8, 2010]",
> +\url{https://lore.kernel.org/lkml/20040807192424.GF3936@in.ibm.com/}",
>  }
>  
>  @unpublished{JimHouston04a,
> @@ -665,8 +660,7 @@ Oregon Health and Sciences University",
>   month="August",
>   year="2004",
>   note="Available:
> -\url{https://lkml.org/lkml/2004/8/30/87}
> -[Viewed February 17, 2005]",
> +\url{https://lore.kernel.org/lkml/1093873222.984.12.camel@new.localdomain/}",
>  }
>  
>  @unpublished{TomHart04a,
> @@ -715,8 +709,7 @@ Oregon Health and Sciences University",
>   month="October",
>   year="2004",
>   note="Available:
> -\url{https://lkml.org/lkml/2004/10/23/241}
> -[Viewed June 8, 2010]",
> +\url{https://lore.kernel.org/lkml/20041023202723.GA1930@us.ibm.com/}",
>  }
>  
>  @unpublished{JamesMorris04a,
> @@ -766,8 +759,7 @@ Oregon Health and Sciences University",
>   year="2005",
>   day="17",
>   note="Available:
> -\url{https://lkml.org/lkml/2005/3/17/199}
> -[Viewed September 5, 2005]",
> +\url{https://lore.kernel.org/lkml/20050318002026.GA2693@us.ibm.com/}",
>  }
>  
>  @unpublished{EsbenNeilsen2005a,
> @@ -777,8 +769,7 @@ Oregon Health and Sciences University",
>   year="2005",
>   day="18",
>   note="Available:
> -\url{https://lkml.org/lkml/2005/3/18/122}
> -[Viewed March 30, 2006]",
> +\url{https://lore.kernel.org/lkml/Pine.OSF.4.05.10503181336310.2466-100000@da410.phys.au.dk/}",
>  }
>  
>  @unpublished{TomHart05a,
> @@ -809,8 +800,7 @@ Data Structures",
>   month="May",
>   year="2005",
>   note="Available:
> -\url{https://lkml.org/lkml/2005/5/9/185}
> -[Viewed May 13, 2005]",
> +\url{https://lore.kernel.org/lkml/20050510012444.GA3011@us.ibm.com/}",
>  }
>  
>  @conference{PaulMcKenney05b,
> @@ -872,8 +862,7 @@ Data Structures",
>   day="1",
>   year="2005",
>   note="Available:
> -\url{https://lkml.org/lkml/2005/8/1/155}
> -[Viewed March 14, 2006]",
> +\url{https://lore.kernel.org/lkml/20050801171137.GA1754@us.ibm.com/}",
>  }
>  
>  @unpublished{PaulMcKenney2005d,
> @@ -883,8 +872,7 @@ Data Structures",
>   day="8",
>   year="2005",
>   note="Available:
> -\url{https://lkml.org/lkml/2005/8/8/108}
> -[Viewed March 14, 2006]",
> +\url{https://lore.kernel.org/lkml/20050808144216.GA1307@us.ibm.com/}",
>  }
>  
>  @unpublished{PaulMcKenney2005rcutorture,
> @@ -894,8 +882,7 @@ Data Structures",
>   day="1",
>   year="2005",
>   note="Available:
> -\url{https://lkml.kernel.org/g/20051001182056.GA1613@us.ibm.com}
> -[Viewed July 9, 2016]",
> +\url{https://lore.kernel.org/all/20051001182056.GA1613@us.ibm.com/}",
>  }
>  
>  @unpublished{DavidSMiller2006HashedLocking,
> @@ -905,8 +892,7 @@ Data Structures",
>   day="6",
>   year="2006",
>   note="Available:
> -\url{https://lkml.org/lkml/2006/1/7/22}
> -[Viewed February 29, 2012]",
> +\url{https://lore.kernel.org/lkml/20060106.231054.43576567.davem@davemloft.net/}",
>  }
>  
>  @conference{ThomasEHart2006a,
> @@ -932,8 +918,7 @@ Distributed Processing Symposium",
>   day="20",
>   year="2006",
>   note="Available:
> -\url{https://lkml.org/lkml/2006/6/20/238}
> -[Viewed March 25, 2008]",
> +\url{https://lore.kernel.org/lkml/20060408134707.22479.33814.sendpatchset@linux.site/}",
>  }
>  
>  @Conference{PaulEMcKenney2006b,
> @@ -1003,8 +988,7 @@ Revised:
>   day="28",
>   year="2006",
>   note="Available:
> -\url{https://lkml.org/lkml/2006/9/28/160}
> -[Viewed March 27, 2008]",
> +\url{https://lore.kernel.org/lkml/20060928142616.GA20185@infradead.org/}",
>  }
>  
>  @unpublished{PaulEMcKenneyRCUusagePage,
> @@ -1034,8 +1018,7 @@ Revised:
>   year="2006",
>   day=26,
>   note="Available:
> -\url{https://lkml.org/lkml/2006/10/26/73}
> -[Viewed January 26, 2009]",
> +\url{https://lore.kernel.org/lkml/20061026105731.GE11803@in.ibm.com/}",
>  }
>  
>  @unpublished{JensAxboe2006SlowSRCU,
> @@ -1046,8 +1029,7 @@ Revised:
>   year="2006",
>   day=17,
>   note="Available:
> -\url{https://lkml.org/lkml/2006/11/17/56}
> -[Viewed May 28, 2007]",
> +\url{https://lore.kernel.org/lkml/20061117092925.GT7164@kernel.dk/}",
>  }
>  
>  @unpublished{OlegNesterov2006QRCU,
> @@ -1058,8 +1040,7 @@ Revised:
>   year="2006",
>   day=19,
>   note="Available:
> -\url{https://lkml.org/lkml/2006/11/19/69}
> -[Viewed May 28, 2007]",
> +\url{https://lore.kernel.org/lkml/20061119190027.GA3676@oleg/}",
>  }
>  
>  @unpublished{OlegNesterov2006aQRCU,
> @@ -1069,8 +1050,7 @@ Revised:
>   year="2006",
>   day=30,
>   note="Available:
> -\url{https://lkml.org/lkml/2006/11/29/330}
> -[Viewed November 26, 2008]",
> +\url{https://lore.kernel.org/lkml/20061130015714.GC1350@oleg/}",
>  }
>  
>  @unpublished{EvgeniyPolyakov2006RCUslowdown,
> @@ -1118,8 +1098,7 @@ Revised:
>   year="2007",
>   day=3,
>   note="Available:
> -\url{https://lkml.org/lkml/2007/1/3/112}
> -[Viewed May 28, 2007]",
> +\url{https://lore.kernel.org/lkml/20070103152738.GA16063@localdomain/}",
>  }
>  
>  @unpublished{PaulEMcKenney2007rcubarrier,
> @@ -1140,8 +1119,7 @@ Revised:
>   year="2007",
>   day=28,
>   note="Available:
> -\url{https://lkml.org/lkml/2007/1/28/34}
> -[Viewed March 27, 2008]",
> +\url{https://lore.kernel.org/lkml/20070128120509.719287000@programming.kicks-ass.net/}",
>  }
>  
>  @unpublished{PaulEMcKenney2007BoostRCU,
> @@ -1160,8 +1138,7 @@ Revised:
>   year="2007",
>   day=24,
>   note="Available:
> -\url{https://lkml.org/lkml/2007/2/25/18}
> -[Viewed March 27, 2008]",
> +\url{https://lore.kernel.org/lkml/20070225062349.GA17468@linux.vnet.ibm.com/}",
>  }
>  
>  @article{JonathanAppavoo2007K42RCU,
> @@ -1238,8 +1215,7 @@ Revised:
>   day="10",
>   year="2007",
>   note="Available:
> -\url{https://lkml.org/lkml/2007/9/10/213}
> -[Viewed October 25, 2007]",
> +\url{https://lore.kernel.org/lkml/20070910183004.GA3299@linux.vnet.ibm.com/}",
>  }
>  
>  @unpublished{PaulEMcKenney2007PreemptibleRCU,
> @@ -1274,8 +1250,7 @@ Revised:
>   day="20",
>   year="2007",
>   note="Available:
> -\url{https://lkml.org/lkml/2007/12/20/244}
> -[Viewed March 27, 2008]",
> +\url{https://lore.kernel.org/lkml/20071220142540.GB22523@Krystal/}",
>  }
>  
>  @unpublished{PaulEMcKenney2007ACCESS:ONCE:rcu,
> @@ -1332,8 +1307,7 @@ Revised:
>   day="29",
>   year="2008",
>   note="Available:
> -\url{https://lkml.org/lkml/2008/1/29/208}
> -[Viewed March 27, 2008]",
> +\url{https://lore.kernel.org/lkml/Pine.LNX.4.58.0801291113350.20371@gandalf.stny.rr.com/}",
>  }
>  
>  @unpublished{PaulEMcKenney2008LKMLDependencyOrdering,
> @@ -1343,8 +1317,7 @@ Revised:
>   day="1",
>   year="2008",
>   note="Available:
> -\url{https://lkml.org/lkml/2008/2/2/255}
> -[Viewed October 18, 2008]",
> +\url{https://lore.kernel.org/lkml/20080202214124.GA28612@linux.vnet.ibm.com/}",
>  }
>  
>  @Conference{PaulEMcKenney2008Beijing,
> @@ -1448,8 +1421,7 @@ lot of {Linux} into your technology!!!",
>   day="21",
>   year="2008",
>   note="Available:
> -\url{https://lkml.org/lkml/2008/8/21/336}
> -[Viewed December 8, 2008]",
> +\url{https://lore.kernel.org/lkml/48AD8969.7060900@colorfullife.com/}",
>  }
>  
>  @unpublished{ManfredSpraul2008dyntickIRQNMI,
> @@ -1459,8 +1431,7 @@ lot of {Linux} into your technology!!!",
>   day="6",
>   year="2008",
>   note="Available:
> -\url{https://lkml.org/lkml/2008/9/6/86}
> -[Viewed December 8, 2008]",
> +\url{https://lore.kernel.org/lkml/48C2B1D2.5070801@colorfullife.com/}",
>  }
>  
>  @unpublished{PaulEMcKenney2007WG21DDOannotation,
> @@ -1512,8 +1483,7 @@ lot of {Linux} into your technology!!!",
>   day="14",
>   year="2009",
>   note="Available:
> -\url{https://lkml.org/lkml/2009/1/14/449}
> -[Viewed January 15, 2009]",
> +\url{https://lore.kernel.org/lkml/20090114202044.GJ6734@linux.vnet.ibm.com/}",
>  }
>  
>  @conference{PaulEMcKenney2009MaliciousURCU,
> @@ -1566,8 +1536,7 @@ lot of {Linux} into your technology!!!",
>   day="25",
>   year="2009",
>   note="Available:
> -\url{https://lkml.org/lkml/2009/6/25/306}
> -[Viewed August 16, 2009]",
> +\url{https://lore.kernel.org/lkml/20090625160706.GA9467@linux.vnet.ibm.com/}",
>  }
>  
>  @unpublished{PaulEMcKenney2009fastRTRCU,
> @@ -1577,8 +1546,7 @@ lot of {Linux} into your technology!!!",
>   day="23",
>   year="2009",
>   note="Available:
> -\url{https://lkml.org/lkml/2009/7/23/294}
> -[Viewed August 15, 2009]",
> +\url{https://lore.kernel.org/lkml/20090724001429.GA17374@linux.vnet.ibm.com/}",
>  }
>  
>  @unpublished{JoshTriplett2009RPHash,
> @@ -1639,8 +1607,7 @@ lot of {Linux} into your technology!!!",
>   month="December",
>   year="2009",
>   note="Available:
> -\url{https://lkml.org/lkml/2009/10/18/129}
> -[Viewed December 29, 2009]",
> +\url{https://lore.kernel.org/lkml/20091018232918.GA7385@Krystal/}",
>  }
>  
>  @unpublished{MathieuDesnoyers2009VerifPrePub,
> @@ -1784,8 +1751,7 @@ lot of {Linux} into your technology!!!",
>   month="January",
>   year="2011",
>   note="Available:
> -\url{https://lkml.org/lkml/2011/1/18/322}
> -[Viewed March 4, 2011]",
> +\url{https://lore.kernel.org/lkml/AANLkTimajU0x1v6y3rH2+jr-bZ=tNLs1S_agXdGGAa3S@mail.gmail.com/}",
>  }
>  
>  @techreport{JoshTriplett2011RPScalableCorrectOrdering,
> @@ -2521,7 +2487,7 @@ Hans Boehm and Clark Nelson and Olivier Giroux",
>   month="October",
>   day="20",
>   year="2014",
> - note="\url{https://lkml.org/lkml/2014/10/20/620}",
> + note="\url{https://lore.kernel.org/lkml/20141020215633.717315139@infradead.org/}",
>  }
>  
>  @techreport{PaulEMcKenney2014cyclicRCU,
> @@ -3102,8 +3068,7 @@ Michael Wong",
>   month="May",
>   day="31",
>   year="2017",
> - note="\url{https://lkml.kernel.org/r/1496232191-13439-1-git-send-email-pbonzini@redhat.com}",
> - lastchecked="April 25, 2018",
> + note="\url{https://lore.kernel.org/lkml/1496232191-13439-1-git-send-email-pbonzini@redhat.com/}",
>  }
>  
>  @unpublished{PaulEMcKenney2017VerificationChallenge6,
> @@ -3298,8 +3263,7 @@ Andrew Hunter and Geoffrey Romer and Lance Roy",
>   month="May",
>   day="18",
>   year="2018",
> - note="\url{https://lkml.kernel.org/r/20180518130413.16997-2-roman.penyaev@profitbricks.com}",
> - lastchecked="April 25, 2018",
> + note="\url{https://lore.kernel.org/lkml/20180518130413.16997-2-roman.penyaev@profitbricks.com/}",
>  }
>  
>  @unpublished{PaulEMcKennney2018C++RCU,
> @@ -3356,7 +3320,7 @@ Read-Copy-Update {(RCU)}",
>   month="February",
>   day="28",
>   year="2019",
> - note="\url{https://lkml.org/lkml/2019/2/27/829}",
> + note="\url{https://lore.kernel.org/lkml/20190228045015.GB10770@shao2-debian/}",
>  }
>  
>  @inproceedings{Jung:2019:PMT:3323298.3323306,
> diff --git a/bib/hw.bib b/bib/hw.bib
> index 7d4772f1f263..164af19a5ebf 100644
> --- a/bib/hw.bib
> +++ b/bib/hw.bib
> @@ -322,8 +322,7 @@ System Programming",
>   year="2010",
>   day="22",
>   note="Available:
> -\url{https://lkml.org/lkml/2010/9/22/283}
> -[Viewed: June 23, 2004]",
> +\url{https://lore.kernel.org/lkml/20100922184144.GA11741@linux.vnet.ibm.com/}",
>  }
>  
>  @unpublished{WilliamPugh2000Gharachorloo,
> diff --git a/bib/os.bib b/bib/os.bib
> index 0846801e88d3..05d9f71841a7 100644
> --- a/bib/os.bib
> +++ b/bib/os.bib
> @@ -822,8 +822,7 @@ on Operating Systems Principles",
>   day="16",
>   year="2002",
>   note="Available:
> -\url{https://lkml.org/lkml/2002/10/15/425}
> -[Viewed March 30, 2008]",
> +\url{https://lore.kernel.org/lkml/Pine.LNX.4.44.0210152040540.1708-100000@penguin.transmeta.com/}",
>  }
>  
>  @unpublished{Torvalds2.5.44,
> @@ -832,8 +831,7 @@ on Operating Systems Principles",
>   month="October",
>   year="2002",
>   note="Available:
> -\url{https://marc.info/?l=linux-kernel&m=103500176112851&w=2}
> -[Viewed February 16, 2021]",
> +\url{https://lore.kernel.org/lkml/Pine.LNX.4.44.0210182117500.12531-100000@penguin.transmeta.com/}",
>  }
>  
>  @unpublished{Torvalds2.5.45,
> @@ -1325,7 +1323,7 @@ and Arbitrary Resources",
>   year="2012",
>   month="April",
>   day="1",
> - note="\url{https://lkml.org/lkml/2012/3/31/131}",
> + note="\url{https://lore.kernel.org/lkml/20120331163321.GA15809@linux.vnet.ibm.com/}",
>  }
>  
>  @unpublished{JonCorbet2013pjtEntityLoadTracking,
> diff --git a/bib/realtime.bib b/bib/realtime.bib
> index 8a5d307c77df..76c29707a477 100644
> --- a/bib/realtime.bib
> +++ b/bib/realtime.bib
> @@ -128,8 +128,7 @@
>   month="June",
>   year="2005",
>   day="22",
> - note="URL: \url{https://lkml.org/lkml/2005/6/22/347}",
> - lastchecked="November 4, 2016",
> + note="URL: \url{https://lore.kernel.org/lkml/20050622211037.GB24029@elte.hu/}",
>  }
>  
>  @unpublished{PaulMcKenney2005f,
> @@ -277,8 +276,7 @@
>   month="April",
>   year="2007",
>   day="5",
> - note="URL: \url{https://lkml.org/lkml/2007/4/5/236}",
> - lastchecked="November 4, 2016",
> + note="URL: \url{https://lore.kernel.org/lkml/20070405194942.1414c030.dada1@cosmosbay.com/}",
>  }
>  
>  @unpublished{KelvinNilsen2007,
> diff --git a/bib/swtools.bib b/bib/swtools.bib
> index 8038e296169b..336ea7752743 100644
> --- a/bib/swtools.bib
> +++ b/bib/swtools.bib
> @@ -774,8 +774,7 @@ Michalis Kokologiannakis",
>   month="April",
>   day="5",
>   year="2018",
> - note={\url{https://lkml.kernel.org/r/1522947547-24081-1-git-send-email-will.deacon@arm.com}},
> - lastchecked="April 6, 2018",
> + note={\url{https://lore.kernel.org/lkml/1522947547-24081-1-git-send-email-will.deacon@arm.com/}},
>  }
>  
>  @article{CaitlinSadowski2018staticAnalysisGoogle,
> diff --git a/bib/syncrefs.bib b/bib/syncrefs.bib
> index 8314f30bc88b..75c44c58399f 100644
> --- a/bib/syncrefs.bib
> +++ b/bib/syncrefs.bib
> @@ -442,7 +442,7 @@ Georgia Institute of Technology",
>   month="January",
>   day="3",
>   year="2013",
> - note="\url{https://lkml.org/lkml/2013/1/3/9}",
> + note="\url{https://lore.kernel.org/lkml/20130103001536.7fd1e952@annuminas.surriel.com/}",
>  }
>  
>  @unpublished{JeremyFitzhardinge2012PVticketlocks,
> diff --git a/howto/howto.tex b/howto/howto.tex
> index 96d1486a11ac..58b472e88c29 100644
> --- a/howto/howto.tex
> +++ b/howto/howto.tex
> @@ -566,7 +566,7 @@ which has the following format:
>  Signed-off-by: My Name <myname@example.org>
>  \end{VerbatimU}
>  
> -Please see \url{https://lkml.org/lkml/2007/1/15/219} for an example
> +Please see \url{https://lore.kernel.org/lkml/20070116022324.GA28513@linux.vnet.ibm.com/} for an example
>  patch with a \co{Signed-off-by:} line.
>  Note well that the \co{Signed-off-by:} line has a very specific meaning,
>  namely that you are certifying that:
> 
> base-commit: 6dc354d48f3166efa21e75b24c4b3d0a6c30f523
> -- 
> 2.25.1
> 
