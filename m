Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:50314 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230442AbhC0XcY (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sat, 27 Mar 2021 19:32:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616887944;
        bh=5hj+QfMV9CxTY4FgBZle67mX+QKZ5n5ShXcYPGZvIbQ=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=U4ySJIBeaAIFqWoOc5JAWl8Dxgz9Ibm0HSWpOT0G1ad3686aaDb0jON6JdtRPyp/i
         BEFRJpd9A9h6AqKk3bXEsDp3Vf8pFq+HvQw9UifxlV9fP/fk2N0dVVBBZCWyeWdyT7
         CtMqT1LVELXfsoMKoHKU5mVwRzlHPSUOlDdVgicgBQQSpfT132H0mO4lwrj5GoekZY
         n0tZ6y0J4H29tN/jbUNJb/0ltwUMD2/DkUIcMiOrbxkbkZcCNle7xtHq72I8VVTayc
         Jk4m98SBxjuDBP8QKpB3TeTurEJQbsp1KQceZZlaWTjqcEn4+Qlj40oqz/j7cB53xx
         EzcrnD6/9Jacg==
Date: Sat, 27 Mar 2021 16:32:23 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 2/2] FAQ-BUILD: Add a description for the automated latex
 package install script
Message-ID: <20210327233223.GS2696@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20210327112124.29206-1-sj38.park@gmail.com>
 <20210327112124.29206-2-sj38.park@gmail.com>
 <d5b99200-0954-8c76-5682-c22c24796786@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5b99200-0954-8c76-5682-c22c24796786@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org

On Sun, Mar 28, 2021 at 07:57:17AM +0900, Akira Yokosawa wrote:
> On Sat, 27 Mar 2021 12:21:24 +0100, SeongJae Park wrote:
> > This commit adds a description for the automated latex package install
> > script, 'utilities/install_latex_package.sh'.
> > 
> > Signed-off-by: SeongJae Park <sj38.park@gmail.com>
> > ---
> >  FAQ-BUILD.txt | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
> > index 0d3330b3..c0afc430 100644
> > --- a/FAQ-BUILD.txt
> > +++ b/FAQ-BUILD.txt
> > @@ -210,6 +210,12 @@
> >  	    2.	Install it by following instructions at:
> >  		https://help.ubuntu.com/community/LaTeX#Installing_packages_manually
> >  
> > +	B.	Instead of above manual steps, you could install the package
> > +		using a script in this repository,
> > +		'./utilities/install_latex_package.sh'.  For example:
> > +
> > +			$ ./utilities/install_latex_package.sh epigraph
> > +
> >  11.	Is it possible to generate SyncTeX database file?
> >  
> >  	A.	Yes, it is. Setting an environment variable:
> > 
> 
> For both 1/2 and 2/2,
> 
> Acked-by: Akira Yokosawa <akiyks@gmail.com>

Applied, thank you both!

							Thanx, Paul
