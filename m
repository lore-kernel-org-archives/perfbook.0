Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245728AbiDKUK1 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 11 Apr 2022 16:10:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C5A629CAA
        for <perfbook@vger.kernel.org>; Mon, 11 Apr 2022 13:08:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BDDD261505
        for <perfbook@vger.kernel.org>; Mon, 11 Apr 2022 20:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649707691;
        bh=KMGNn+RPE14FzDBTsFxnJ8AmGMa0doCYEjw5+BZZK5Q=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=OF1tHYSbJ0dD8eTH5yTAAbF3r0EPQHU4/3SYIlFQyBJ0p6mE2hrzW/iyRg3JfrJbW
         l9QLFNGBMzyIZimFDt8Rq7pW0ubLa3qR+RRLRU9QHcK+ph1FJ/kMHI98t5cxrPP/91
         gxJWem0IdnY4LyqUSqlXuyLeVFwL1puiVulIj0h71MntF2YddK9dWyw6kb5d2na6rq
         BTkOx6ti6ahSvdLBfGwC/IxciOlS3mojQpXz5evhlK73Wq/e3KtCkXHDQfsEq9+tmR
         arV2ytWf0cefGKb23V7+DYC6FRogwxPcKBQNO8Iav1d+pSZKVN0yo4WJZf2Lis2dey
         jf8TOUv5sFNzQ==
Date: Mon, 11 Apr 2022 13:08:10 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 0/7] Build script updates
Message-ID: <20220411200810.GB4285@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <b756ba87-3fd3-1865-d8c0-3fb0ba45966b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b756ba87-3fd3-1865-d8c0-3fb0ba45966b@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Apr 11, 2022 at 04:49:01PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> Here is a set of updates to build scripts.
> 
> Patch 1/7 is to avoid possible build errors when previous build
> is interrupted in the middle of converting figures with some
> intermediate temporary eps and/or pdf file(s) left. 
> 
> Example of such an error (long message not folded):
> 
> CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocatall.eps --> .pdf
> make: *** No rule to make target 'CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocatall__.eps', needed by 'CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocatall__.pdf'.  Stop.
> 
> After this type of an error (or errors after a parallel build),
> one needs to run "make clean" (or "make neatfreak"), and run
> "make" again.
> 
> By adding commands in Makefile to ignore file names of "*__.eps",
> this mode of error can be avoided.
> 
> The added pattern in .gitignore resolves false "Untracked files"
> from "git status".
> 
> Patch 2/7 fixes redundant use of filter-out function in Makefile.
> 
> Patch 3/7 updates help texts regarding EBook-size builds in
> Makefile.  They don't need (WIP) anymore.
> 
> Patch 4/7 is to allow use of LaTeX commands other than "pdflatex".
> In vanilla TeX Live, there is an alternative command of
> "pdflatex-dev", which is used to test development-phase
> latex implementation.  With this change, I am allowed to test
> it by saying "make LATEX=pdflatex-dev".
> 
> Patch 5/7 is to catch typo in the LATEX variable.
> 
> Patch 6/7 catches an error exit of LATEX command and print log
> messages to the terminal.
> 
> Patch 7/7 is a cosmetic tweak improving the later stages of
> progress reports from parallel builds.

Queued and pushed, thank you!

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (7):
>   Makefile: Ignore temporary .eps files
>   Makefile: Remove redundant nest of filter-out function
>   Makefile: Let ebook-size builds graduate from 'WIP'
>   run{first}latex.sh: Use variable for 'pdflatex' command
>   Makefile: Test $(LATEX) before invoking runfirstlatex.sh
>   run(first)latex.sh: Catch error exit of LATEX
>   runlatex.sh: Align status report messages
> 
>  .gitignore                            |   1 +
>  Makefile                              |  27 ++++-
>  Makefile.2022.01.25                   |   4 +-
>  utilities/runfirstlatex.2022.01.25.sh |  98 +++++++++++++++
>  utilities/runfirstlatex.sh            |  16 ++-
>  utilities/runlatex.2022.01.25.sh      | 164 ++++++++++++++++++++++++++
>  utilities/runlatex.sh                 |  23 ++--
>  7 files changed, 314 insertions(+), 19 deletions(-)
>  create mode 100644 utilities/runfirstlatex.2022.01.25.sh
>  create mode 100644 utilities/runlatex.2022.01.25.sh
> 
> 
> base-commit: 87d3513257e793b90f53ebd4b138ab2371aaf25c
> -- 
> 2.25.1
> 
