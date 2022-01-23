Return-Path: <perfbook-owner@vger.kernel.org>
Received: from ams.source.kernel.org ([145.40.68.75]:48164 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbiAWTQe (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 23 Jan 2022 14:16:34 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2EA96B80E15
        for <perfbook@vger.kernel.org>; Sun, 23 Jan 2022 19:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642965391;
        bh=5T/sWeWdVInuDTEDDn+uBLjh0qHr9HSUqEodjkKc6Rg=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=PAqs4Z+EofY3lKpw1ZwOz/L9PkzzGuTmjVFS56X4pAojDJRAOb5ut6kpX/lhFeJUO
         OywzrPfki0e9oPOcBAbDbwNA5jqZ6StuoNeEWULh1IGQiJH+ncjw5kR/9Iyv8g2NxK
         a3lGtOqnaD3O8v82V2mLV//zUY8OTM2qYnyV+NplgIEQx11YQTKfIR58ZEUhAwXWdq
         DipNADND5psW43HUvqe0WnYeGrC8oFkcHa1PvWpdBZTtLkNt8r3n5YpyuIJdQoqeOh
         xWba1i3RjWIti85JUBo+xiMQrd5TmlC+0a+Thm7jZioXL8UsBW9y+vCe5H3Ucm4LTX
         H7OLpq7gWlhMg==
Date: Sun, 23 Jan 2022 11:16:31 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH-perfbook v4] RFC: make some bibliography items better
Message-ID: <20220123191631.GA4285@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20220122094611.11332-1-zhouzhouyi@gmail.com>
 <8af9b735-8d96-f4d1-a26e-a566930e428f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8af9b735-8d96-f4d1-a26e-a566930e428f@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>, perfbook@vger.kernel.org, luyang.co@gmail.com

On Sat, Jan 22, 2022 at 07:10:58PM +0900, Akira Yokosawa wrote:
> On Sat, 22 Jan 2022 17:46:11 +0800,
> Zhouyi Zhou wrote:
> > make following bibliography items better
> > 1. "Relativistic Red-Black Trees"
> > 2. "Speculative Lock Elision: Enabling Highly Concurrent Multithreaded Execution"
> > 3. "Architectural Support for Software Transactional Memory"
> > 4. "Transactional Memory Architecture and Implementation for IBM System z"
> > 
> > Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com> 
> > ---
> > Thank Akira for your valuable advice!
> > 
> > I feel that each new version is much better than previous one.
> > 
> > Following is my new version, and I invoked "make" after the change,
> > further suggestions is very welcome.
> 
> Looks good to me!
> 
> Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed with the usual wordsmithing, thank you both!

							Thanx, Paul

>         Thanks, Akira
> 
> > 
> > Thanks again
> > 
> > Sincerely
> > Zhouyi
> > --
> >  bib/RCU.bib |  8 +++++---
> >  bib/TM.bib  | 15 ++++++++++-----
> >  2 files changed, 15 insertions(+), 8 deletions(-)
> > 
> > diff --git a/bib/RCU.bib b/bib/RCU.bib
> > index 3e2bf423..12c37619 100644
> > --- a/bib/RCU.bib
> > +++ b/bib/RCU.bib
> > @@ -2190,11 +2190,13 @@ lot of {Linux} into your technology!!!",
> >   author = {Philip W. Howard and Jonathan Walpole},
> >   title = {Relativistic Red-Black Trees},
> >   journal = {Concurrency and Computation: Practice and Experience},
> > - year = {2013},
> > + year = {2014},
> > + month = "November",
> >   issn = {1532-0634},
> > - pages = {n/a--n/a},
> > + pages = {2684--2712},
> > + volume = {26},
> > + number = {16},
> >   numpages = {29},
> > - url = {http://dx.doi.org/10.1002/cpe.3157},
> >   doi = {10.1002/cpe.3157},
> >  }
> >  
> > diff --git a/bib/TM.bib b/bib/TM.bib
> > index e4412afd..0f222647 100644
> > --- a/bib/TM.bib
> > +++ b/bib/TM.bib
> > @@ -117,6 +117,7 @@ on Computer Architecture",
> >   Title = "Speculative Lock Elision: Enabling Highly Concurrent Multithreaded
> >  Execution",
> >   Booktitle = "Proceedings of the 34\textsuperscript{th} Annual ACM/IEEE International Symposium on Microarchitecture",
> > + series = {MICRO 34},
> >   publisher="The Institute of Electrical and Electronics Engineers, Inc.",
> >   month="December",
> >   year="2001",
> > @@ -372,7 +373,8 @@ Languages, Compilers, and Hardware Support for Transactional Computing},
> >  @inproceedings{BratinSaha2006MICRO,
> >   author = {Saha, Bratin and Adl-Tabatabai, Ali-Reza and Jacobson, Quinn},
> >   title = {Architectural Support for Software Transactional Memory},
> > - booktitle = {MICRO 39: Proceedings of the 39th Annual IEEE/ACM International Symposium on Microarchitecture},
> > + booktitle = {Proceedings of the 39\textsuperscript{th} Annual IEEE/ACM International Symposium on Microarchitecture},
> > + series = {MICRO 39},
> >   year = {2006},
> >   isbn = {0-7695-2732-9},
> >   pages = {185--196},
> > @@ -963,15 +965,18 @@ for Programming Languages and Operating Systems (ASPLOS '09)",
> >   note="\url{https://paulmck.livejournal.com/tag/transactional%20memory%20everywhere}",
> >  }
> >  
> > -@unpublished{ChristianJacobi2012MainframeTM,
> > +@conference{ChristianJacobi2012MainframeTM,
> >   author={Christian Jacobi and Timothy Slegel and Dan Greiner},
> >   title="Transactional Memory Architecture and Implementation for {IBM} {System} z",
> > + booktitle="Proceedings of the 45\textsuperscript{th} Annual IEEE/ACM International Symposium on Microarchitecture",
> > + series = {MICRO 45},
> > + pages = {25--36},
> >   month="December",
> >   year="2012",
> > + address={Vancouver B.C. Canada},
> >   doi="10.1109/MICRO.2012.12",
> > - note="The 45\textsuperscript{th} Annual IEEE/ACM International Symposium
> > -on MicroArchitecture, URL: \url{https://www.microarch.org/micro45/talks-posters/3-jacobi-presentation.pdf}",
> > - lastchecked="November 13, 2016",
> > + note="Presentation slides:
> > +  \url{https://www.microarch.org/micro45/talks-posters/3-jacobi-presentation.pdf}",
> >  }
> >  
> >  @conference{JustinGottschlich2013TMdebug,
