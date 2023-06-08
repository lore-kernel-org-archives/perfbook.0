Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236511AbjFHSVJ (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 8 Jun 2023 14:21:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81F941993
        for <perfbook@vger.kernel.org>; Thu,  8 Jun 2023 11:21:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0C52264D0A
        for <perfbook@vger.kernel.org>; Thu,  8 Jun 2023 18:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686248466;
        bh=X6bfgT4KgH7+H2a4/Aqzi2BQmEufuJaTsAKc2InsyAw=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=se3CLKVWYOzJKWFLJe2UOqo6wJ84T7Ry1sRARXoXSVQ6JIZmDFcKBwmu7STB8cIhl
         Z/G5F+TGTZqaTwqDXm3AawrZbcuNLFDdhcYCz2xaOnen7+siWIl7lpwLPQ2HKNM1ak
         no9rl5l50l3fw2Wlnhwc6BRqu/YiKZDWiTRMCBUyQaXNJsDywuJ+/CUfV1rcq7UBQ7
         LNNGecVVqIVBWya4/Bn9XGQhARqStKBOkib6uGt3+Hi4v+JXyKjvyQcUPfFgVy3qNB
         ed7OtcmPJxo00p2LhI9l7Vyg9tQroQgIyn8JdtV6eTGA8YoUe6h266J5x1kaUS+0Km
         3ONRb5hnNnR5g==
Date: Thu, 8 Jun 2023 11:21:05 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] utilities/gitlab-ci: Remove custom build of fig2ps
Message-ID: <26f066f9-a537-4c3b-b3b9-8566610a8ac4@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20230603175548.12944-1-leobras.c@gmail.com>
 <918699e4-d788-e891-5853-30d782631ff8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <918699e4-d788-e891-5853-30d782631ff8@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Leonardo Bras <leobras.c@gmail.com>, perfbook@vger.kernel.org

On Tue, Jun 06, 2023 at 12:52:13PM +0900, Akira Yokosawa wrote:
> On Sat,  3 Jun 2023 14:55:37 -0300, Leonardo Bras wrote:
> > Since commit 1f907f3d77dd ("Use fig2dev as fallback to fig2eps"),
> > there is no need to install fig2ps in the container for building the pdfs.
> > 
> > Remove those steps to simplify the building process.
> > 
> > Suggested-by: Akira Yokosawa <akiyks@gmail.com>
> > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > ---
> > 
> > Tested on Gitlab Pipeline:
> > https://gitlab.com/linux-kernel/perfbook/-/pipelines/888505608
> 
> Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you both!

							Thanx, Paul

> >  utilities/gitlab-ci.yml | 3 ---
> >  1 file changed, 3 deletions(-)
> > 
> > diff --git a/utilities/gitlab-ci.yml b/utilities/gitlab-ci.yml
> > index 6c3ec1e6..544b9373 100644
> > --- a/utilities/gitlab-ci.yml
> > +++ b/utilities/gitlab-ci.yml
> > @@ -21,9 +21,6 @@ generate_pdfs:
> >      before_script:
> >          - pacman --noconfirm -Sy texlive-meta fig2dev ghostscript graphviz inkscape wget make which fontconfig git ttf-dejavu gnu-free-fonts ttf-liberation
> >          - mkdir -p ~/.local/share/fonts && cp fonts/steel-city-comic.regular.ttf ~/.local/share/fonts/ && fc-cache
> > -        - wget https://sourceforge.net/projects/fig2ps/files/latest/download -O /dev/shm/fig2ps.tbz
> > -        - mkdir /dev/shm/build && tar -xjf /dev/shm/fig2ps.tbz -C /dev/shm/build --strip-components=1
> > -        - make install -C /dev/shm/build
> >  
> >      script:
> >          - make perfbook.pdf perfbook-1c.pdf perfbook-eb.pdf
