Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0022C17E
	for <perfbook@vger.kernel.org>; Fri, 20 Jun 2025 06:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750402692; cv=none; b=g8WaQrV8L9kAKeWrpNMI+NUpiVNAA4vJnOD23IaTS2ESgOLZ2D1Dp0G9l0xPzgzwscUCnI7CTK/DjbS3sS7X3xuU0iBUhS+gwX+0aB1ZqMi052nNJXdvAh4N28BWIBUSpoNmUlUAJd1n2LuooBVr1in3Ji4WCEQGvlxvxygWhPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750402692; c=relaxed/simple;
	bh=T9QzOEkjK1ywqyZmKM/0NixLAAbOFEdMPG3CACkuJmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rHi1YwuVTz0NFZrUNXTPIQ8wzV9pzUtkqYuwmikMoxrzNC+DOmRZgubgD7CY5Z/P27FtaFCDdhm9qSed8gvEtyDw/aQKAwlz1imZz7LKuskX1QT2d/b4TihcD/cWHLk1+ZwMt1l6mCxUn83Bt889oyqLcDOjTVeJaV04glhPXRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Axo0Cdky; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Axo0Cdky"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B06CC4CEE3;
	Fri, 20 Jun 2025 06:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750402691;
	bh=T9QzOEkjK1ywqyZmKM/0NixLAAbOFEdMPG3CACkuJmk=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Axo0CdkybNOoKIMelLGusAVq5/dg/mQKWZnmF8wWuRvqSGLTY2F1VC3gCMvPGaPKa
	 VhKk27fPoyaieo2zgTDRMv3+BjaeZ9eIR7DQrBSSfLVE+Q/JDHAIuQXnVLcZLOGUKn
	 7kRHVtX4f30OJRhXGULamyH/CnusTq8XwQuUIcasrDi6lUiGJu2KsXYYlwELWTi2y9
	 t9jyvLbcTWS3eegohjdbQgixiVZps6TntigPFFCS/GA0g3H81aRn0sA9dgaGTDoBRQ
	 El6bPWA1g321P6tJGkkEcUb9v0kxMfUh2VMSgaiputlLb/xx5Hvetg+CtXwPdNQ6md
	 no9UTX3r0tDPA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 4BE77CE1071; Thu, 19 Jun 2025 23:58:08 -0700 (PDT)
Date: Thu, 19 Jun 2025 23:58:08 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org, Leonardo Bras <lsoaresp@redhat.com>
Subject: Re: [PATCH -perfbook] gitlab-ci: Append /usr/bin/*_perl to PATH
Message-ID: <53d8230a-adef-4b14-a0cf-96a0d41ae7dc@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <8820751b-9b42-4408-b388-14f42030b891@gmail.com>
 <89277ea0-1e60-416d-ac00-526574f74189@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89277ea0-1e60-416d-ac00-526574f74189@gmail.com>

On Fri, Jun 20, 2025 at 01:44:45PM +0900, Akira Yokosawa wrote:
> On Sat, 14 Jun 2025 11:33:16 +0900, Akira Yokosawa wrote:
> > Subject: [PATCH -perfbook] gitlab-ci: Append /usr/bin/*_perl to PATH
> > 
> > Under archlinux-based container runs, non-login shells need to source
> > /etc/profile to have package-specific commands such as encguess (under
> > /usr/bin/core_perl) appended in its PATH.
> > 
> > Add the command so that the change in commit 00361e8bb1e5 ("Convert
> > *.log files into UTF-8 encoding") to work in gitlab-ci builds.
> > 
> > Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > Cc: Leonardo Bras <lsoaresp@redhat.com>
> > ---
> > Hi Leo,
> > 
> > I think this should work, but I have not tested under gitlab-ci.
> > Can you apply this and see if the message from grep:
> > 
> >     ...
> >     pdflatex 1 for perfbook.pdf
> >     grep: perfbook.log: binary file matches     <===
> >     ...
> > 
> > disappears in the build log?
> 
> Paul, having failed to hear from Leo, can I ask you to take and push this?
> I will see the log of Leo's gitlab-CI job once it finishes.

Done!  And I will of course be happy to take any updates that might
prove necessary.

							Thanx, Paul

>         Thanks, Akira
> 
> > 
> >         Thanks, Akira
> > --
> >  utilities/gitlab-ci.yml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/utilities/gitlab-ci.yml b/utilities/gitlab-ci.yml
> > index 60e70a26..f03e39a9 100644
> > --- a/utilities/gitlab-ci.yml
> > +++ b/utilities/gitlab-ci.yml
> > @@ -23,6 +23,7 @@ generate_pdfs:
> >          - mkdir -p ~/.local/share/fonts && cp fonts/steel-city-comic.regular.ttf ~/.local/share/fonts/ && fc-cache
> >  
> >      script:
> > +        - source /etc/profile
> >          - make perfbook.pdf perfbook-1c.pdf perfbook-eb.pdf
> >  
> >      artifacts:
> > 
> > base-commit: 00361e8bb1e59a0cf7a2a83028fab323f60c2207
> 
