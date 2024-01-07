Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775E61171E
	for <perfbook@vger.kernel.org>; Sun,  7 Jan 2024 21:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DgApqQ9V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D06B6C433C7;
	Sun,  7 Jan 2024 21:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704662228;
	bh=Qy1zJagNLE8qwfuzEjcSvuITcFcSktpn6p63FgFd5LM=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=DgApqQ9VOqVzlShawGo88DmtwiqwWTDQtYeI9ToOKNlvNpWnCGCiY8mHG3VzDQQRb
	 E4fC9tFnSW27teVozYjQRHZ9ODUEEzAKYMawzA2liIcFuggsljva6qWPgdbJzqWMfJ
	 JzUc5DW0HAIgZC7nTlnUQNGO4LsX7vFOVR0mLUaNdxTOkYszjglslBDMKrZ6P/+AP+
	 N49gf1SywHfnn4ThDnaHdmxDGwhw2ytCT50C7ZIanizBNNk9eYVpLHeRGLib7k8FNh
	 lagVNWq8pk2CUvMhAPOrd+DUK/d/3aJd+ho2ck0bcrpQCUKs04hmLn21iBEn9RJ+O4
	 2aGZLf0EqZJ5g==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 59E86CE1F74; Sun,  7 Jan 2024 13:17:08 -0800 (PST)
Date: Sun, 7 Jan 2024 13:17:08 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Leonardo =?iso-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook 8/8] gitlab-ci.yml: Install librsvg instead of
 inkscape
Message-ID: <a45327d6-729c-40ae-a7bb-6ad7fb63f3cd@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <8d0ffcdc-59f9-49ef-b8e1-313e71cac913@gmail.com>
 <07aca12c-85f9-4e8c-b0f6-1e502cdd8cc5@gmail.com>
 <b49648d42bbd646241edbf4b360adb68d7322cb4.camel@gmail.com>
 <ae5a1ed4-dd5b-469f-9a6a-b3c7dc475d49@gmail.com>
 <887c14299660953517677bd3ba5d8f0c64623d7e.camel@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <887c14299660953517677bd3ba5d8f0c64623d7e.camel@gmail.com>

On Sat, Jan 06, 2024 at 12:37:38AM -0300, Leonardo Brás wrote:
> On Sat, 2024-01-06 at 10:15 +0900, Akira Yokosawa wrote:
> > Hi Leo,
> > 
> > On Fri, 05 Jan 2024 18:39:15 -0300, Leonardo Brás wrote:
> > > On Fri, 2024-01-05 at 18:58 +0900, Akira Yokosawa wrote:
> > > > On Arch Linux, rsvg-convert is provided in the librsvg package.
> > > > Install it instead of inkscape.
> > > > 
> > > > Using rsvg-convert can shorten runtime of CI job for building PDFs
> > > > a bit.
> > > > 
> > > > Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > > > Cc: Leonardo Bras <leobras.c@gmail.com>
> > > > ---
> > > 
> > > Hello Akira, 
> > > 
> > > I used the leobras-ci branch from gitlab/linux_kernel/perfbook to test your
> > > patchset: 
> > > https://gitlab.com/linux-kernel/perfbook/-/jobs/5872530547
> > 
> > Thank you for taking the time!
> > 
> > > 
> > > It generated the pdf successfully, could you check if the images were generated
> > > correctly?
> > > https://gitlab.com/linux-kernel/perfbook/-/jobs/5872530547/artifacts/browse
> > 
> > Looks good to me.
> > 
> 
> Amazing! so
> Tested-by: Leonardo Bras <leobras.c@gmail.com>
> 
> > > 
> > > > Needs an explicit ACK or Tested-by from Leo.
> > > > Expected order of reduction of build time:  ~10s
> > 
> > And the job took 11m53s.
> > Previous runs: 13m29s, 12m57s, 13m50s, 13m45s, 12m26s ...
> > Not installing inkscape should also help reduce the time.
> > 
> 
> Yeah, it's a pretty big suite, you are most probably correct.
> 
> > > > 
> > > >  utilities/gitlab-ci.yml | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/utilities/gitlab-ci.yml b/utilities/gitlab-ci.yml
> > > > index bcda8712..17525fb4 100644
> > > > --- a/utilities/gitlab-ci.yml
> > > > +++ b/utilities/gitlab-ci.yml
> > > > @@ -19,7 +19,7 @@ generate_pdfs:
> > > >      stage: build
> > > >  
> > > >      before_script:
> > > > -        - pacman --noconfirm -Syu texlive-meta fig2dev ghostscript graphviz inkscape wget make which fontconfig git ttf-dejavu gnu-free-fonts ttf-liberation
> > > > +        - pacman --noconfirm -Syu texlive-meta fig2dev ghostscript graphviz librsvg wget make which fontconfig git ttf-dejavu gnu-free-fonts ttf-liberation
> > > 
> > > so s/inkscape/librsvg/ right? 
> > 
> > Yes.
> > 
> > > 
> > > It's fine by me.
> > 
> > May I take that as your Acked-by: ?
> > 
> 
> Sure:
> 
> Acked-by: Leonardo Bras <leobras.c@gmail.com>

Applied both, thank you!

							Thanx, Paul

> 
> >         Thanks, Akira
> > 
> 
> Thank you!
> Leo
> 
> > > 
> > > Thanks!
> > > Leo
> > > 
> > > >          - mkdir -p ~/.local/share/fonts && cp fonts/steel-city-comic.regular.ttf ~/.local/share/fonts/ && fc-cache
> > > >  
> > > >      script:
> > > 
> 
