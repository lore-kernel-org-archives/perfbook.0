Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:50158 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726787AbhAFX34 (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Wed, 6 Jan 2021 18:29:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609975755;
        bh=vDJC4u9IzMbRF+ttZmXwPyYbXH3fTZFGbhK5JVwY9r8=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=MjLtZUeVUFCBNFcEkzQjMeSjDPx9Wopz44A/0sY615a94sTlcg6FY5YLqrNJAIO5L
         j84DB/HqfIZNGEDUMuj+D5UFIsWocHZViZUDD3RJdz54RnVksgEXY942tck+yz7wHn
         gSx23yxBmVc4BN8lAaL8NdeJ0p26XKC/ZZA6VC7fYM6e7bSbB8yfCpNyPNfO+cAz3S
         S4iwlEgrWHuOB1VWUDc8luOaycmQdBOKUNRxs9EcJmkSXgzkFvLrVUrODm7MxW0ql2
         Xsz+KsVkqzUPZIwk6I7pj9kul50J0PXRDAl+ARqWObFpzA41iY/UCDtZ87qgnr61c5
         gF9N1+wz1y2lQ==
Date: Wed, 6 Jan 2021 15:29:15 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 2/2 -perfbook] FAQ-BUILD: Add Q&A on Docker image
Message-ID: <20210106232915.GH2743@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <63638566-e9e8-4be6-2d25-b0919b3805d1@gmail.com>
 <831592e1-ffca-ac9e-920f-0f4b52b99bb1@gmail.com>
 <b36e6c73-b435-8c3c-b7ce-f4122107ba4d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b36e6c73-b435-8c3c-b7ce-f4122107ba4d@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Jan 06, 2021 at 11:36:14PM +0900, Akira Yokosawa wrote:
> On Wed, 6 Jan 2021 19:32:42 +0900, Akira Yokosawa wrote:
> > From 165d967a252652e2ef5af82ce62536dbcf314600 Mon Sep 17 00:00:00 2001
> > From: Akira Yokosawa <akiyks@gmail.com>
> > Date: Wed, 6 Jan 2021 19:03:55 +0900
> > Subject: [PATCH 2/2 -perfbook] FAQ-BUILD: Add Q&A on Docker image
> > 
> > The template Dockerfile and the usage explained is a tutorial level.
> > Suggestions from Docker-savvy people are more than welcome.
> > 
> > Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > ---
> >  FAQ-BUILD.txt | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> > 
> > diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
> > index 2eeb9fbb..d4c18424 100644
> > --- a/FAQ-BUILD.txt
> > +++ b/FAQ-BUILD.txt
> > @@ -273,3 +273,25 @@
> >  
> >  		    sudo updmap-sys --syncwithtrees --force
> >  		    sudo updmap-sys
> > +
> > +14.	I want a stable environment to build perfbook.pdf.
> > +	Isn't some container image available in that regard?
> > +
> > +	A.	You can find a template Dockerfile under the docker/
> > +		subdirectory.
> > +		A docker image built from it can be pulled by:
> > +
> > +		    docker pull akiyks/perfbook-build-env:focal
> > +
> > +		It can be run with the command:
> > +
> > +		    docker run --rm -it -v <path to perfbook dir>:/work \
> > +		      akiyks/perfbook-build-env:focal bash
> 
> If we add a "-u" option specifying host-side uid:gid to run the container,
> it is safe to do Git operations from inside the container.
> This is because the container does all the I/O to the mounted host directory.
> So the following note can be removed.
> 
> I'll respin 2/2.

This does look like it would be very helpful to people trying to get
their environment set up!

							Thanx, Paul

>         Thanks, Akira
> 
> > +
> > +		Note:
> > +		    The directory to be mounted to /work you give to the
> > +		    "-v" option should be a newly cloned git repository.
> > +		    You should avoid using any git command from the container
> > +		    that might modify repository meta data and change their
> > +		    owner.
> > +		    Git operations should be done from the host side.
> > 
