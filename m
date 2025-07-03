Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5A3257436
	for <perfbook@vger.kernel.org>; Thu,  3 Jul 2025 16:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751561054; cv=none; b=HHvu93X1qYw1hqG/Bi/V/X12s3aljLGaBhup+d9WNP0HXUUuc+GDpzbcbKI1eUOU8O0qw4f0wjKYdhOquussaEbHJ/fUTaTjwr2oDyO1ou2d2PBuE7sxVmxRqZCq2CIpEjPiyWDWfCW+W6zWVnYlHiQm8o1FsNAHOhWDPkUmkIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751561054; c=relaxed/simple;
	bh=VcxYmdGhqClS37VV63oaA+cF9CXUDRBXSPJXiSjiaBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZBbJWY5/NXI5UQM6PHf7OV49ns1zJla4/FzZ/UAI9fIyI6Q1uk3u/z4Ro9Vma8C2Mrc14GhoAxw3ATWWvTNasWL3W8/WZ+mWGiXMNpqZps+M6WMyVfQtsr8QD+eJrWHxmPO4mkBg5iFgO7VfA3ZlLpacwYsz+sdNYXz/e/agCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MYy4KEgs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MYy4KEgs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AD95C4CEE3;
	Thu,  3 Jul 2025 16:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751561054;
	bh=VcxYmdGhqClS37VV63oaA+cF9CXUDRBXSPJXiSjiaBQ=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=MYy4KEgsM6TfrhlOBdiBK82j3tNBuhK6rNIRG9t8KfUqVZZsE4bEH29zXDqdGv004
	 /dDLr+oD42VqA5pZfDsKwMZJ9AExBMjkI8thoqTSR/tbjdiDq/cXaAH8ggedj5xFoa
	 RHhNegl7qPXK8XpBPD/roIrLCGXA4pgoLwS6DGgGXMPybI77pqs5iHy/QpCpT5L0lX
	 QCl2tYcglfd6hZ9MLcSE8mxH/faY9OAaxfjqhxEkrOb1PTEjtyYiExwHf2QYHdOw8b
	 Br1Ab/EoUIJ65VaeOoiHFo0L02w/DuYgRyI3kDFuN+yhnD7pLO2llqov7I+20jH8s6
	 zsAgVG+5vjpnw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id F1E32CE0C97; Thu,  3 Jul 2025 09:44:13 -0700 (PDT)
Date: Thu, 3 Jul 2025 09:44:13 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Leonardo Bras <leobras@redhat.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org,
	Leonardo Bras <lsoaresp@redhat.com>
Subject: Re: [PATCH -perfbook] gitlab-ci: Append /usr/bin/*_perl to PATH
Message-ID: <3bb75f45-8772-48bf-8ae3-a13aef17e442@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <8820751b-9b42-4408-b388-14f42030b891@gmail.com>
 <89277ea0-1e60-416d-ac00-526574f74189@gmail.com>
 <53d8230a-adef-4b14-a0cf-96a0d41ae7dc@paulmck-laptop>
 <53199ddf-f7c9-44cd-8fb8-8e4a659353d5@gmail.com>
 <291997d0-53f9-4052-a0b3-905b94b746c3@paulmck-laptop>
 <aGacfnxb6KpF0Wye@LeoBras>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGacfnxb6KpF0Wye@LeoBras>

On Thu, Jul 03, 2025 at 12:06:38PM -0300, Leonardo Bras wrote:
> On Fri, Jun 20, 2025 at 04:17:37AM -0700, Paul E. McKenney wrote:
> > On Fri, Jun 20, 2025 at 07:41:53PM +0900, Akira Yokosawa wrote:
> > > On Thu, 19 Jun 2025 23:58:08 -0700, Paul E. McKenney wrote:
> > > > On Fri, Jun 20, 2025 at 01:44:45PM +0900, Akira Yokosawa wrote:
> > > >> On Sat, 14 Jun 2025 11:33:16 +0900, Akira Yokosawa wrote:
> > > >>> Subject: [PATCH -perfbook] gitlab-ci: Append /usr/bin/*_perl to PATH
> > > >>>
> > > >>> Under archlinux-based container runs, non-login shells need to source
> > > >>> /etc/profile to have package-specific commands such as encguess (under
> > > >>> /usr/bin/core_perl) appended in its PATH.
> > > >>>
> > > >>> Add the command so that the change in commit 00361e8bb1e5 ("Convert
> > > >>> *.log files into UTF-8 encoding") to work in gitlab-ci builds.
> > > >>>
> > > >>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > > >>> Cc: Leonardo Bras <lsoaresp@redhat.com>
> > > >>> ---
> > > [...]
> > > 
> > > >> Paul, having failed to hear from Leo, can I ask you to take and push this?
> > > >> I will see the log of Leo's gitlab-CI job once it finishes.
> > > > 
> > > > Done!  And I will of course be happy to take any updates that might
> > > > prove necessary.
> > > 
> > > Leo's gitlab-CI have finished successfully.  All looks good!
> > 
> > Very good, and thank you!
> > 
> > 							Thanx, Paul
> > 
> 
> Hi Akira, Paul,
> 
> Sorry for the delay on replying. I have been majorly focused on an internal 
> project and unfortunatelly have been neglecting patch-tagged e-mails.
> 
> I have nothing against the change, and I am happy it works :)
> 
> Thank you for finding out the issue and fixing it, and thanks Paul for 
> pushing it so it could be tested!

No problem and glad that it worked out.  And thank you again for having
set up the gitlib-CI for us!

							Thanx, Paul
