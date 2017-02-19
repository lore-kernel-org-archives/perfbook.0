Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:37790 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751307AbdBSWLr (ORCPT <rfc822;perfbook@vger.kernel.org>); Sun, 19
 Feb 2017 17:11:47 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v1JM8g8e024634
 for <perfbook@vger.kernel.org>; Sun, 19 Feb 2017 17:11:46 -0500
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 28pphuhduw-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sun,
 19 Feb 2017 17:11:46 -0500
Received: from localhost by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 19 Feb
 2017 15:11:46 -0700
Date: Sun, 19 Feb 2017 14:11:42 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] Bibliography updates (append urls -- part 2)
Reply-To: paulmck@linux.vnet.ibm.com
References: <874fe02f-0887-55ad-4611-bc9af7fd5184@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874fe02f-0887-55ad-4611-bc9af7fd5184@gmail.com>
Message-Id: <20170219221142.GK30506@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Feb 16, 2017 at 12:14:12AM +0900, Akira Yokosawa wrote:
> >From 12c6802578e421628b996ee10cef6c3b3df47960 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Tue, 15 Nov 2016 00:01:02 +0900
> Subject: [PATCH] Bibliography updates (append urls -- part 2)
> 
> This commit appends urls to the following entries:
> 
>   o PanagiotisMetaxas1999PDCS
>   o McKusick88
>   o Magnusson94
>   o MagedMichael95a
>   o McKenney98
>   o McKenney04a
>   o Rajwar01a
>   o Rajwar02a
>   o Soules03a
>   o Sarma04c
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Applied and pushed, thank you!

							Thanx, Paul

> ---
> Hi Paul,
> 
> Here is another round of bibliography updates.
> It consists of mostly the same type of updates as the previous one
> (just appending urls).
> The remaining updates will be submitted in 2 or 3 more rounds.
> We are getting closer to the goal of bibliography updates ;-)
> 
>                                      Thanks, Akira
> --
>  bib/RCU.bib         | 8 ++++++++
>  bib/TM.bib          | 5 +++++
>  bib/WFS.bib         | 2 ++
>  bib/os.bib          | 2 ++
>  bib/parallelsys.bib | 2 ++
>  bib/syncrefs.bib    | 2 ++
>  6 files changed, 21 insertions(+)
> 
> diff --git a/bib/RCU.bib b/bib/RCU.bib
> index 580b1a1..4614520 100644
> --- a/bib/RCU.bib
> +++ b/bib/RCU.bib
> @@ -221,6 +221,8 @@ Problems"
>  ,Year="1998"
>  ,pages="509-518"
>  ,Address="Las Vegas, NV"
> +,url="http://www.rdrop.com/users/paulmck/RCU/rclockpdcsproof.pdf"
> +,lastchecked="November 14, 2016"
>  }
> 
>  @Conference{Gamsa99
> @@ -494,6 +496,8 @@ Michal Ostrowski and Bryan Rosenburg and Jimi Xenidis"
>  ,year="2003"
>  ,month="June"
>  ,pages="141-154"
> +,url="https://www.ece.cmu.edu/~ganger/papers/k42Usenix.pdf"
> +,lastchecked="November 14, 2016"
>  }
> 
>  @article{McKenney03a
> @@ -538,6 +542,8 @@ Michal Ostrowski and Bryan Rosenburg and Jimi Xenidis"
>  ,volume="1"
>  ,number="118"
>  ,pages="38-46"
> +,url="http://www.linuxjournal.com/article/7124"
> +,lastchecked="November 14, 2016"
>  }
> 
>  @Conference{McKenney04b
> @@ -600,6 +606,8 @@ Realtime Applications"
>  ,year="2004"
>  ,month="June"
>  ,pages="182-191"
> +,url="http://www.rdrop.com/~paulmck/RCU/realtimeRCU.2004.06.12a.pdf"
> +,lastchecked="November 14, 2016"
>  }
> 
>  @phdthesis{PaulEdwardMcKenneyPhD
> diff --git a/bib/TM.bib b/bib/TM.bib
> index e8aa11a..04d45ad 100644
> --- a/bib/TM.bib
> +++ b/bib/TM.bib
> @@ -103,6 +103,8 @@ Execution"
>  ,year="2001"
>  ,address = "Austin, TX"
>  ,pages = "294-305"
> +,url="http://pages.cs.wisc.edu/~rajwar/papers/micro01.pdf"
> +,lastchecked="November 14, 2016"
>  }
> 
>  @conference{Martinez02a
> @@ -129,6 +131,9 @@ Operating Systems"
>  ,year="2002"
>  ,pages="5-17"
>  ,address = "Austin, TX"
> +,doi="10.1145/605397.605399"
> +,url="http://pages.cs.wisc.edu/~rajwar/papers/asplos02.pdf"
> +,lastchecked="November 14, 2016"
>  }
> 
>  @incollection{HerlihyLMS03
> diff --git a/bib/WFS.bib b/bib/WFS.bib
> index 35713e7..d7efdf6 100644
> --- a/bib/WFS.bib
> +++ b/bib/WFS.bib
> @@ -118,6 +118,8 @@ Linear or Sublinear Complexity"
>  ,year="1995"
>  ,note="Technical Report TR599"
>  ,organization="Computer Science Department, University of Rochester"
> +,url="https://pdfs.semanticscholar.org/cec0/ad7b0fc2d4d6ba45c6212d36217df1ff2bf2.pdf"
> +,lastchecked="November 14, 2016"
>  }
> 
>  @conference{MichaelScott96
> diff --git a/bib/os.bib b/bib/os.bib
> index b2762c7..7d48633 100644
> --- a/bib/os.bib
> +++ b/bib/os.bib
> @@ -155,6 +155,8 @@ Kernel"
>  ,address = "Berkeley CA"
>  ,month="June"
>  ,year="1988"
> +,url="https://docs.freebsd.org/44doc/papers/kernmalloc.pdf"
> +,lastchecked="November 13, 2016"
>  }
> 
>  @article{Lee89
> diff --git a/bib/parallelsys.bib b/bib/parallelsys.bib
> index 2091bcd..e9c4b5b 100644
> --- a/bib/parallelsys.bib
> +++ b/bib/parallelsys.bib
> @@ -327,5 +327,7 @@ Parallel and Distributed Computing and Systems"
>  ,pages={570--576}
>  ,publisher={IASTED}
>  ,address={Cambridge, MA, USA}
> +,url="http://cs.wellesley.edu/~pmetaxas/pdcs99.pdf"
> +,lastchecked="November 13, 2016"
>  }
> 
> diff --git a/bib/syncrefs.bib b/bib/syncrefs.bib
> index 21d2007..4a0b1be 100644
> --- a/bib/syncrefs.bib
> +++ b/bib/syncrefs.bib
> @@ -1142,6 +1142,8 @@ Multiprocessors"
>  ,number="T94:07"
>  ,month="February"
>  ,pages="32"
> +,url="http://dl.acm.org/citation.cfm?id=869729"
> +,lastchecked="November 13, 2016"
>  }
> 
>  @article{Zhang94
> -- 
> 2.7.4
> 

