Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjFCPWQ (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sat, 3 Jun 2023 11:22:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BC689D
        for <perfbook@vger.kernel.org>; Sat,  3 Jun 2023 08:22:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1FE8C61510
        for <perfbook@vger.kernel.org>; Sat,  3 Jun 2023 15:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685805734;
        bh=E25GazQNCDWMpIb65gB9mjZ3M+0oPQ/Ve9E9Q5qvMTw=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=eQGgUEYWcK/gFk6Pf3X7s7zI+p7gvWoiv+qGrta170H8ATUF+cq5ZxzloFNwLjRP+
         qk4VhCQmZZWcoACkbIRxwciXUkgz0jaO10sMJL+qWg5WHchi+WWoIinA8LrggTqQry
         zY4tYbmp0WtK3/hTXUUlZtVOj95Qb3EkVpXpLddmY+YsopnrUhN0TRKMWUbid2k5nS
         /wXFTE5dt17vPmdFbJeAwjO7iBt8Eu1Dxs2Usx93XOeq/x1rVxKLDg7i5aNcXJxxR9
         o/2VJPjt5eVthzhRu8wVCRAKggPBHk7y6DsUHwnW+oSW8axfEkLkQ5Fm1bXOGTfcvD
         /aToWyzj2VmrQ==
Date: Sat, 3 Jun 2023 08:22:14 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [RFC PATCH 1/1] utilities/gitlab-ci: Fix gitlab-ci due to Arch
 Linux deprecating texlive-most
Message-ID: <ae32471b-28cc-48b7-97fe-b3fddb99bbd5@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20230601203816.996788-1-leobras.c@gmail.com>
 <2274e683-8b17-f974-5f6c-2a2b51d13cff@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2274e683-8b17-f974-5f6c-2a2b51d13cff@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Leonardo Bras <leobras.c@gmail.com>, perfbook@vger.kernel.org

On Sat, Jun 03, 2023 at 02:02:23PM +0900, Akira Yokosawa wrote:
> Hi Leo,
> 
> Why is this "RFC" ??? :-)
> 
> On Thu,  1 Jun 2023 17:38:16 -0300, Leonardo Bras wrote:
> > Arch Linux folks deprecated the texlive-most package group in favor of
> > texlive-meta, which should contain the same packages with an aditional
> > tool.
> > 
> > Fix this script to use texlive-meta, so the gitlab pipeline is able to
> > build the pdfs.
> > 
> > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > ---
> >  utilities/gitlab-ci.yml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/utilities/gitlab-ci.yml b/utilities/gitlab-ci.yml
> > index 42eda60f..6c3ec1e6 100644
> > --- a/utilities/gitlab-ci.yml
> > +++ b/utilities/gitlab-ci.yml
> > @@ -19,7 +19,7 @@ generate_pdfs:
> >      stage: build
> >  
> >      before_script:
> > -        - pacman --noconfirm -Sy texlive-most fig2dev ghostscript graphviz inkscape wget make which fontconfig git ttf-dejavu gnu-free-fonts ttf-liberation
> > +        - pacman --noconfirm -Sy texlive-meta fig2dev ghostscript graphviz inkscape wget make which fontconfig git ttf-dejavu gnu-free-fonts ttf-liberation
> >          - mkdir -p ~/.local/share/fonts && cp fonts/steel-city-comic.regular.ttf ~/.local/share/fonts/ && fc-cache
> >          - wget https://sourceforge.net/projects/fig2ps/files/latest/download -O /dev/shm/fig2ps.tbz
> >          - mkdir /dev/shm/build && tar -xjf /dev/shm/fig2ps.tbz -C /dev/shm/build --strip-components=1
> 
> I don't think there is anybody who bothers with gitlab-ci
> other than you.  You can do whatever you'd like, I guess.
> 
> FWIW,
> 
> Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you both!

							Thanx, Paul

> Sidenote:
> 
> Since commit 1f907f3d77dd ("Use fig2dev as fallback to fig2eps"),
> there is no need to install fig2ps in the container.
> 
>         Thanks, Akira
> 
