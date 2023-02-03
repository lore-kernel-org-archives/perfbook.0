Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbjBCEsi (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 2 Feb 2023 23:48:38 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76BDD709A3
        for <perfbook@vger.kernel.org>; Thu,  2 Feb 2023 20:48:36 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 982B7B827B1
        for <perfbook@vger.kernel.org>; Fri,  3 Feb 2023 04:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675399714;
        bh=X3q2ocNkMoLIw0ayS3kWuxs4F6o58Y/O4zFRSi4krRY=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=pOqwLlOhQStdzMmD2z37ah/Rhs/CkxVbvrLnVDxtd1bK1KkTkWpWal54EZY62/Kyb
         5iycxsH9Fw0lJ4RuadsP8uuQhpkpUaYHDPYJy5ZuH5eDxsjdqz4MWUA5xlLfCq1mdI
         QzDD/WeAMghE9Jggv9ZbOpYoS7+ZYz+tHENXyD8zGFhFSshgQZT+tKk4BYN+xxdfHe
         ToZyCs5nMXOAyiMkkBymXsHaN/OfmjTL/KnSyikZx9ENyck+tII89wgxEi/gtMQzSP
         Y7YA2ZjBjDevQoliBl8rLqBkwrfZ6uttqVqRj+mD500XxIJx/0qlGxwtRnu9LsLGRB
         bqjvczeD40Rdw==
Date: Thu, 2 Feb 2023 20:48:33 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v2] Add utilities/gitlab-ci.yml for pdf generation and
 testing on Gitlab.
Message-ID: <20230203044833.GG2948950@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20230203021853.34207-1-leobras.c@gmail.com>
 <265b0793-78bc-d8b4-5a4a-8198854b2f01@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <265b0793-78bc-d8b4-5a4a-8198854b2f01@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Leonardo Bras <leobras.c@gmail.com>, perfbook@vger.kernel.org

On Fri, Feb 03, 2023 at 12:03:18PM +0900, Akira Yokosawa wrote:
> On Thu,  2 Feb 2023 23:18:55 -0300, Leonardo Bras wrote:
> > For Gitlab repositories mirroring the original repository, trigger the
> > Gitlab-CI after every push to the original repo.
> > 
> > For the pipeline to run, the Gitlab repo needs to configure:
> > - Settings -> CI/CD -> General Pipelines -> CI/CD configuration file to
> >   utilities/gitlab-ci.yml
> > 
> > What the pipeline does:
> > - Compile-test CodeSamples
> > - IF pass, build PDFs: regular, 1c, eb
> > 
> > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > ---
> >  utilities/gitlab-ci.yml | 33 +++++++++++++++++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> >  create mode 100644 utilities/gitlab-ci.yml
> 
> Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you both!

							Thanx, Paul

> > diff --git a/utilities/gitlab-ci.yml b/utilities/gitlab-ci.yml
> > new file mode 100644
> > index 00000000..acc12fb2
> > --- /dev/null
> > +++ b/utilities/gitlab-ci.yml
> > @@ -0,0 +1,33 @@
> > +image: archlinux:latest
> > +
> > +stages:
> > +  - test
> > +  - build
> > +
> > +test_codesamples:
> > +    stage: test
> > +
> > +    before_script:
> > +        - pacman --noconfirm -Sy make gcc liburcu
> > +
> > +    script:
> > +        - make -C CodeSamples/
> > +
> > +generate_pdfs:
> > +    stage: build
> > +
> > +    before_script:
> > +        - pacman --noconfirm -Sy texlive-most fig2dev ghostscript graphviz inkscape wget make which fontconfig git ttf-dejavu gnu-free-fonts
> > +        - mkdir -p ~/.local/share/fonts && cp fonts/steel-city-comic.regular.ttf ~/.local/share/fonts/ && fc-cache
> > +        - wget https://sourceforge.net/projects/fig2ps/files/latest/download -O /dev/shm/fig2ps.tbz
> > +        - mkdir /dev/shm/build && tar -xjf /dev/shm/fig2ps.tbz -C /dev/shm/build --strip-components=1
> > +        - make install -C /dev/shm/build
> > +
> > +    script:
> > +        - make perfbook.pdf perfbook-1c.pdf perfbook-eb.pdf
> > +
> > +    artifacts:
> > +      paths:
> > +          - perfbook.pdf
> > +          - perfbook-1c.pdf
> > +          - perfbook-eb.pdf
> 
> 
