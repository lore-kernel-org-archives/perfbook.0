Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:52713 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1750741AbdARWmb (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Wed, 18 Jan 2017 17:42:31 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v0IMdBRf113133
 for <perfbook@vger.kernel.org>; Wed, 18 Jan 2017 17:42:30 -0500
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 282dcx8py2-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Wed,
 18 Jan 2017 17:42:30 -0500
Received: from localhost by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Wed, 18 Jan
 2017 15:42:29 -0700
Date: Wed, 18 Jan 2017 14:42:25 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] bib/TM: Salvage url or replace with doi
Reply-To: paulmck@linux.vnet.ibm.com
References: <549f772d-3292-e860-e0d5-8d68a86a3bd5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <549f772d-3292-e860-e0d5-8d68a86a3bd5@gmail.com>
Message-Id: <20170118224225.GR5238@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Jan 19, 2017 at 12:33:22AM +0900, Akira Yokosawa wrote:
> >From 4a8befacf6cf23d0452d4071d34025cec1fd1671 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Thu, 19 Jan 2017 00:22:24 +0900
> Subject: [PATCH] bib/TM: Salvage url or replace with doi
> 
> This commit salvages broken url or replace with doi of
> the following entries in TM.bib:
> 
>   o DaveDice2009ASPLOSRockHTM
>   o CliffClick2009AzulHTM
>   o Ali-Reza-Adl-Tabatabai2009CppTM
>   o ChristianJacobi2012MainframeTM
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Nice!  Queued and pushed, thank you!

							Thanx, Paul

> ---
> Hi Paul,
> 
> So, I changed my mind. Instead of bombarding you with pull requests of long
> branches, I picked up a few commits that actually fix broken urls.
> I suppose such a small batch of fixes would be much easier for you to review
> and apply.
> If this approach is preferable, I'll submit small batches one by one. Just
> appending doi or url should have lower priority than actual fixes.
> Please let me know what you think.
> 
>                                                    Thanks, Akira
> --
>  bib/TM.bib | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/bib/TM.bib b/bib/TM.bib
> index f69370f..7114806 100644
> --- a/bib/TM.bib
> +++ b/bib/TM.bib
> @@ -585,9 +585,7 @@ Cain and Peng Wu and Stefanie Chiras and Siddhartha Chatterjee"
>  for Programming Languages and Operating Systems (ASPLOS '09)"
>  ,pages="157--168"
>  ,address="Washington, DC, USA"
> -,note="Available:
> -\url{http://research.sun.com/scalable/pubs/ASPLOS2009-RockHTM.pdf}
> -[Viewed February 4, 2009]"
> +,doi="10.1145/1508244.1508263"
>  }
> 
>  @conference{HansJBoehm2009HOTPAR
> @@ -642,7 +640,9 @@ for Programming Languages and Operating Systems (ASPLOS '09)"
>  ,title="And now some Hardware Transactional Memory comments..."
>  ,month="February"
>  ,year="2009"
> -,note="\url{http://www.azulsystems.com/blog/cliff-click/2009-02-25-and-now-some-hardware-transactional-memory-comments}"
> +,note="URL:
> +\url{http://www.cliffc.org/blog/2009/02/25/and-now-some-hardware-transactional-memory-comments/}"
> +,lastchecked="November 4, 2016"
>  }
> 
>  @unpublished{Ali-Reza-Adl-Tabatabai2009CppTM
> @@ -650,7 +650,9 @@ for Programming Languages and Operating Systems (ASPLOS '09)"
>  ,title="Draft Specification of Transactional Language Constructs for C++"
>  ,Year="2009"
>  ,Month="August"
> -,Note="\url{http://research.sun.com/scalable/pubs/C++-transactional-constructs-1.0.pdf}"
> +,Note="URL:
> +\url{https://software.intel.com/sites/default/files/ee/47/21569} (may need to append .pdf to view after download)"
> +,lastchecked="November 12, 2016"
>  }
> 
>  @unpublished{JoeDuffy2010RetroTM
> @@ -882,7 +884,8 @@ for Programming Languages and Operating Systems (ASPLOS '09)"
>  ,month="December"
>  ,year="2012"
>  ,note="The 45\textsuperscript{th} Annual IEEE/ACM International Symposium
> -on MicroArchitecture \url{http://www.microsymposia.org/micro45/talks-posters/3-jacobi-presentation.pdf}"
> +on MicroArchitecture, URL: \url{http://www.microarch.org/micro45/talks-posters/3-jacobi-presentation.pdf}"
> +,lastchecked="November 13, 2016"
>  }
> 
>  @conference{JustinGottschlich2013TMdebug
> -- 
> 2.7.4
> 
> 

